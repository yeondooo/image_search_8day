import 'package:image_search_8day/core/result.dart';
import 'package:image_search_8day/data/repository/pixabay_photo_repository_impl.dart';
import 'package:image_search_8day/domain/model/photo.dart';

class GetTopFiveViewdImageUseCase {
  final PixabayPhotoRepositoryImpl _repository;

  GetTopFiveViewdImageUseCase(this._repository);

  Future<Result<List<Photo>>> execute(String query) async {
    try {
      final photos = await _repository.getPhotos(query);
      photos.sort((a, b) => -a.views.compareTo(b.views));

      return Result.success(photos.take(5).toList());
    } catch (err) {
      return const Result.error('에러가 발생했습니다.');
    }
  }
}
