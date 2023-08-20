import 'package:wallpaper_app/data/models/models.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';

extension PhotoModelEx on Photo {
  PhotoModel toModel() {
    return PhotoModel(
      id: id,
      width: width,
      height: height,
      photographer: photographer,
      alt: alt,
      url: url,
      src: src,
    );
  }
}
