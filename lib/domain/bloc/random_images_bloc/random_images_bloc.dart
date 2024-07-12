import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_api_bloc/data/model/image_pixabay_model.dart';
import 'package:pixabay_api_bloc/domain/repository/image_pixabay_interface.dart';

part 'random_images_bloc.freezed.dart';

@freezed
class RandomImageEvent with _$RandomImageEvent {
  const factory RandomImageEvent.init(String element) = _initEvent;
}

@freezed
class RandomImageState with _$RandomImageState {
  const factory RandomImageState.loading() = _loadingState;

  const factory RandomImageState.loaded(
      {List<ImagePixabay>? images, String? category}) = _loadedState;

  const factory RandomImageState.errorState() = _errorState;
}

class RandomImageBloc extends Bloc<RandomImageEvent, RandomImageState> {
  RandomImageBloc({
    required ImageRepositoryInterface imageRepository,
  })  : _imageRepository = imageRepository,
        super(const RandomImageState.loading()) {
    on<RandomImageEvent>((event, emit) async {
      await event.maybeMap(
        orElse: () {},
        init: (event) async {
          emit(const RandomImageState.loading());
          try {
            final response =
                await _imageRepository.getRandomImages(event.element);
            emit(RandomImageState.loaded(
                images: response, category: event.element));
          } catch (error) {
            emit(const RandomImageState.errorState());
          }
        },
      );
    });
  }

  final ImageRepositoryInterface _imageRepository;
}
