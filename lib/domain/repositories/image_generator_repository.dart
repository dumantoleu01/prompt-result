import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/generated_image.dart';

abstract class ImageGeneratorRepository {
  Future<Either<Failure, GeneratedImage>> generateImage(String prompt);
}
