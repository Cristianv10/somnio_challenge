import 'package:kiwi/kiwi.dart';
import 'package:somnio/domain/challenge/repository/challenge_repository.dart';
import 'package:somnio/infrastructure/data_sources/challenge_data_sources.dart';
import 'package:somnio/infrastructure/repository/challenge_repository.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();

  static void setup() {
    var injector = _$Injector();
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureChallengeModule();
  }

  void _configureChallengeModule() {
    _configureChallengeFactories();
  }

  @Register.factory(ChallengeDataSource)
  @Register.factory(ChallengeRepository, from: ChallengeRepositoryImpl)
  void _configureChallengeFactories();
}
