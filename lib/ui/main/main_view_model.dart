import 'package:flutter/material.dart';
import 'package:image_search_8day/data/repository/pixabay_photo_repository_impl.dart';
import 'package:image_search_8day/ui/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final PixabayPhotoRepositoryImpl _repository;

  MainViewModel(this._repository);

  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: false);
    notifyListeners();

    _state = state.copyWith(
      photos: await _repository.getPhotos(query),
      isLoading: false,
    );
    notifyListeners();
  }
}
