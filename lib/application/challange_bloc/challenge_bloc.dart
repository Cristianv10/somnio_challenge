import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc_event.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc_state.dart';
import 'package:somnio/domain/challenge/repository/challenge_repository.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  final ChallengeRepository challengeRepository;

  ChallengeBloc(this.challengeRepository) : super(ChallengeInitial()) {
    on<LoadPostInformation>(_onLoadPostInformation);
  }

  Future<void> _onLoadPostInformation(
      LoadPostInformation event, Emitter<ChallengeState> emit) async {
    emit(ChallengeLoading());
    final eitherResponse = await challengeRepository.fetchPostInformation();

    eitherResponse.fold(
      (error) => emit(ChallengeError('Failed to load data')),
      (data) => emit(ChallengeLoaded(data)),
    );
  }
}
