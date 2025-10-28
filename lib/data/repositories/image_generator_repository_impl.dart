import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/generated_image.dart';
import '../../domain/repositories/image_generator_repository.dart';
import '../datasources/image_generator_remote_data_source.dart';

class ImageGeneratorRepositoryImpl implements ImageGeneratorRepository {
  final ImageGeneratorRemoteDataSource remoteDataSource;

  ImageGeneratorRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, GeneratedImage>> generateImage(String prompt) async {
    try {
      final result = await remoteDataSource.generateImage(prompt);
      return Right(result);
    } catch (e) {
      return Left(GenerationFailure(e.toString()));
    }
  }
}
