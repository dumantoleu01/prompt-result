import 'package:equatable/equatable.dart';

abstract class ImageGeneratorEvent extends Equatable {
  const ImageGeneratorEvent();

  @override
  List<Object> get props => [];
}

class GenerateImageEvent extends ImageGeneratorEvent {
  final String prompt;

  const GenerateImageEvent(this.prompt);

  @override
  List<Object> get props => [prompt];
}

class RegenerateImageEvent extends ImageGeneratorEvent {
  const RegenerateImageEvent();
}
