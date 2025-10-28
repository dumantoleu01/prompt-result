import 'data/datasources/image_generator_remote_data_source.dart';
import 'data/repositories/image_generator_repository_impl.dart';
import 'domain/usecases/generate_image.dart';
import 'presentation/bloc/image_generator_bloc.dart';

class InjectionContainer {
  static ImageGeneratorBloc? _bloc;

  static ImageGeneratorBloc getBloc() {
    if (_bloc == null) {
      final dataSource = ImageGeneratorRemoteDataSourceImpl();
      final repository = ImageGeneratorRepositoryImpl(dataSource);
      final useCase = GenerateImage(repository);
      _bloc = ImageGeneratorBloc(generateImageUseCase: useCase);
    }
    return _bloc!;
  }

  static void dispose() {
    _bloc?.close();
    _bloc = null;
  }
}
