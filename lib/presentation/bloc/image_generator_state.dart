import 'package:equatable/equatable.dart';
import '../../domain/entities/generated_image.dart';

abstract class ImageGeneratorState extends Equatable {
  const ImageGeneratorState();

  @override
  List<Object?> get props => [];
}

class ImageGeneratorInitial extends ImageGeneratorState {
  const ImageGeneratorInitial();
}

class ImageGeneratorLoading extends ImageGeneratorState {
  const ImageGeneratorLoading();
}

class ImageGeneratorSuccess extends ImageGeneratorState {
  final GeneratedImage image;

  const ImageGeneratorSuccess(this.image);

  @override
  List<Object> get props => [image];
}

class ImageGeneratorError extends ImageGeneratorState {
  final String message;

  const ImageGeneratorError(this.message);

  @override
  List<Object> get props => [message];
}
