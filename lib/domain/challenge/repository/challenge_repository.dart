import 'package:either_dart/either.dart';
import 'package:somnio/domain/challenge/entities/post.dart';
import 'package:somnio/domain/core/generic_invalid_data.dart';

abstract class ChallengeRepository {
  Future<Either<GenericInvalidData, List<Post>>> fetchPostInformation();
}
