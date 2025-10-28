import 'dart:math';
import '../models/generated_image_model.dart';

abstract class ImageGeneratorRemoteDataSource {
  Future<GeneratedImageModel> generateImage(String prompt);
}

class ImageGeneratorRemoteDataSourceImpl implements ImageGeneratorRemoteDataSource {
  final Random _random = Random();

  @override
  Future<GeneratedImageModel> generateImage(String prompt) async {
    await Future.delayed(const Duration(milliseconds: 2500));

    if (_random.nextBool()) {
      throw Exception('Generation failed. Please try again.');
    }

    return GeneratedImageModel(imageUrl: 'assets/images/screen.jpg', prompt: prompt);
  }
}
