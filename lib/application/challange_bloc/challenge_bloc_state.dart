// challenge_state.dart
abstract class ChallengeState {}

class ChallengeInitial extends ChallengeState {}

class ChallengeLoading extends ChallengeState {}

class ChallengeLoaded extends ChallengeState {
  final dynamic data;
  ChallengeLoaded(this.data);
}

class ChallengeError extends ChallengeState {
  final String message;
  ChallengeError(this.message);
}
