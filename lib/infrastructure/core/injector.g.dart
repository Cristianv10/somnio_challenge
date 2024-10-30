// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureChallengeFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => ChallengeDataSource())
      ..registerFactory<ChallengeRepository>((c) => ChallengeRepositoryImpl(
          challengeDataSource: c.resolve<ChallengeDataSource>()));
  }
}
