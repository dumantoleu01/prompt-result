import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/generate_image.dart';
import 'image_generator_event.dart';
import 'image_generator_state.dart';

class ImageGeneratorBloc extends Bloc<ImageGeneratorEvent, ImageGeneratorState> {
  final GenerateImage generateImageUseCase;
  String? _currentPrompt;

  ImageGeneratorBloc({required this.generateImageUseCase}) : super(const ImageGeneratorInitial()) {
    on<GenerateImageEvent>(_onGenerateImage);
    on<RegenerateImageEvent>(_onRegenerateImage);
  }

  Future<void> _onGenerateImage(GenerateImageEvent event, Emitter<ImageGeneratorState> emit) async {
    _currentPrompt = event.prompt;
    emit(const ImageGeneratorLoading());

    final result = await generateImageUseCase(event.prompt);

    result.fold(
      (failure) => emit(ImageGeneratorError(failure.message)),
      (image) => emit(ImageGeneratorSuccess(image)),
    );
  }

  Future<void> _onRegenerateImage(
    RegenerateImageEvent event,
    Emitter<ImageGeneratorState> emit,
  ) async {
    if (_currentPrompt != null) {
      emit(const ImageGeneratorLoading());

      final result = await generateImageUseCase(_currentPrompt!);

      result.fold(
        (failure) => emit(ImageGeneratorError(failure.message)),
        (image) => emit(ImageGeneratorSuccess(image)),
      );
    }
  }
}
