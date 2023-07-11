import 'package:flutter/material.dart';
import 'package:image_search_8day/core/result.dart';
import 'package:image_search_8day/domain/use_case/get_top_five_viewd_image_use_case.dart';
import 'package:image_search_8day/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetTopFiveViewdImageUseCase _getTopFiveViewdImageUseCase;

  MainViewModel(this._getTopFiveViewdImageUseCase);

  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: false);
    notifyListeners();
    final result = await _getTopFiveViewdImageUseCase.execute(query);

    switch (result) {
      case Success(:final data):
        _state = state.copyWith(
          photos: data,
          isLoading: false,
        );
      case Error(:final e):
        _state = state.copyWith(isLoading: false);
    }
    notifyListeners();
  }
}
