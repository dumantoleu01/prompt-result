import 'package:equatable/equatable.dart';

class GeneratedImage extends Equatable {
  final String imageUrl;
  final String prompt;

  const GeneratedImage({required this.imageUrl, required this.prompt});

  @override
  List<Object> get props => [imageUrl, prompt];
}
