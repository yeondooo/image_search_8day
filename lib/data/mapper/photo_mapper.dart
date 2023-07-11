import 'package:image_search_8day/data/dto/pixabay_resylt_dto.dart';
import 'package:image_search_8day/data/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id ?? 0,
      url: webformatURL ?? '',
      views: views ?? 0,
    );
  }
}
