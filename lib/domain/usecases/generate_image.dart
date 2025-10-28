import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/generated_image.dart';
import '../repositories/image_generator_repository.dart';

class GenerateImage {
  final ImageGeneratorRepository repository;

  GenerateImage(this.repository);

  Future<Either<Failure, GeneratedImage>> call(String prompt) async {
    return await repository.generateImage(prompt);
  }
}
