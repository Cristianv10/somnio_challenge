import 'package:either_dart/either.dart';
import 'package:somnio/domain/challenge/entities/post.dart';
import 'package:somnio/domain/challenge/repository/challenge_repository.dart';
import 'package:somnio/domain/core/generic_invalid_data.dart';
import 'package:somnio/infrastructure/data_sources/challenge_data_sources.dart';

class ChallengeRepositoryImpl extends ChallengeRepository {
  final ChallengeDataSource challengeDataSource;

  ChallengeRepositoryImpl({
    required this.challengeDataSource,
  });

  @override
  // implement this method in the data layer
  Future<Either<GenericInvalidData, List<Post>>> fetchPostInformation() async {
    try {
      final post = await challengeDataSource.fetchPostInformation();
      return Right(post);
    } on GenericInvalidData catch (e) {
      return Left(e);
    }
  }
}
