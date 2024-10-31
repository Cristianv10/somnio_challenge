import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc_event.dart';
import 'package:somnio/application/challange_bloc/challenge_bloc_state.dart';
import 'package:somnio/domain/challenge/repository/challenge_repository.dart';
import 'package:somnio/domain/core/generic_invalid_data.dart';

// Mock del ChallengeRepository usando mocktail
class MockChallengeRepository extends Mock implements ChallengeRepository {}

void main() {
  // test for ChallengeBloc
  group('ChallengeBloc', () {
    late MockChallengeRepository mockChallengeRepository;
    late ChallengeBloc challengeBloc;

    setUp(() {
      mockChallengeRepository = MockChallengeRepository();
      challengeBloc = ChallengeBloc(mockChallengeRepository);
    });

    tearDown(() {
      challengeBloc.close();
    });

// test for LoadPostInformation event correct behavior
    blocTest<ChallengeBloc, ChallengeState>(
      'emits [ChallengeLoading, ChallengeLoaded] when LoadPostInformation is added and data is loaded successfully',
      build: () {
        // Simulamos un resultado exitoso
        when(() => mockChallengeRepository.fetchPostInformation())
            .thenAnswer((_) async => Right([])); // Lista vacía simulada
        return challengeBloc;
      },
      act: (bloc) => bloc.add(LoadPostInformation()),
      expect: () => [
        ChallengeLoading(),
        ChallengeLoaded([]),
      ],
    );

// test for LoadPostInformation event error behavior

    blocTest<ChallengeBloc, ChallengeState>(
      'emits [ChallengeLoading, ChallengeError] when LoadPostInformation is added and loading data fails',
      build: () {
        when(() => mockChallengeRepository.fetchPostInformation()).thenAnswer(
            (_) async => Left(GenericInvalidData<dynamic>(
                '00000', 'Failed to load data', '')));
        return challengeBloc;
      },
      act: (bloc) => bloc.add(LoadPostInformation()),
      expect: () => [
        ChallengeLoading(),
        ChallengeError('Failed to load data'),
      ],
    );
  });
}
