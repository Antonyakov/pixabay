import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_api_bloc/constants/random_category.dart';
import 'package:pixabay_api_bloc/data/model/image_pixabay_model.dart';
import 'package:pixabay_api_bloc/domain/repository/image_pixabay_interface.dart';

part 'search_image_bloc.freezed.dart';

@freezed
class SearchImageEvent with _$SearchImageEvent {
  const factory SearchImageEvent.init(String element) = _initEvent;

  const factory SearchImageEvent.searchImages(String query) =
      _searchImagesEvent;
}

@freezed
class SearchImageState with _$SearchImageState {
  const factory SearchImageState.initial() = _initialState;

  const factory SearchImageState.loading() = _loadingState;

  const factory SearchImageState.loaded(
      {List<ImagePixabay>? images, String? category}) = _loadedState;

  const factory SearchImageState.errorState() = _errorState;
}

class SearchImageBloc extends Bloc<SearchImageEvent, SearchImageState> {
  SearchImageBloc({
    required ImageRepositoryInterface imageRepository,
  })  : _imageRepository = imageRepository,
        super(const SearchImageState.initial()) {
    on<SearchImageEvent>((event, emit) async {
      await event.maybeMap(
          orElse: () {},
          init: (event) async {
            emit(const SearchImageState.loading());
            try {
              final response = await _imageRepository
                  .getRandomImages(RandomCategory().elementRandom);
              emit(SearchImageState.loaded(
                  images: response, category: event.element));
            } catch (error) {
              emit(const SearchImageState.errorState());
            }
          },
          searchImages: (event) async {
            emit(const SearchImageState.loading());
            try {
              final response =
                  await _imageRepository.getImagesWithQuery(event.query);
              emit(SearchImageState.loaded(images: response));
            } catch (error) {
              emit(const SearchImageState.errorState());
            }
          });
    });
  }

  final ImageRepositoryInterface _imageRepository;
}
