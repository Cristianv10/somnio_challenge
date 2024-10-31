// challenge_state.dart
import 'package:equatable/equatable.dart';

abstract class ChallengeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChallengeInitial extends ChallengeState {}

class ChallengeLoading extends ChallengeState {}

class ChallengeLoaded extends ChallengeState {
  final dynamic data;

  ChallengeLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class ChallengeError extends ChallengeState {
  final String message;

  ChallengeError(this.message);

  @override
  List<Object?> get props => [message];
}
