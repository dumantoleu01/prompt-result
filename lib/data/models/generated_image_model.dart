import '../../domain/entities/generated_image.dart';

class GeneratedImageModel extends GeneratedImage {
  const GeneratedImageModel({required super.imageUrl, required super.prompt});

  factory GeneratedImageModel.fromJson(Map<String, dynamic> json) {
    return GeneratedImageModel(
      imageUrl: json['imageUrl'] as String,
      prompt: json['prompt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'imageUrl': imageUrl, 'prompt': prompt};
  }
}
