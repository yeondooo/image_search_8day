import 'package:image_search_8day/data/api/pixabay_api.dart';
import 'package:image_search_8day/data/mapper/photo_mapper.dart';
import 'package:image_search_8day/data/model/photo.dart';
import 'photo_repository.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final resultDto = await _api.getImages(query);

    return resultDto.hits.map((e) => e.toPhoto()).toList();
  }
}
