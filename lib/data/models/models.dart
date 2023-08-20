import 'package:wallpaper_app/domain/entities/entities.dart';

class ResponseModel {
  final int page;
  final int perPage;
  final List<Photo> photos;
  final int totalResults;
  const ResponseModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> map) {
    return ResponseModel(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      photos: List<Photo>.from(
        (map['photos'] as List<dynamic>).map<Photo>(
          (x) => PhotoModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
      totalResults: map['total_results'] as int,
    );
  }
}

class PhotoModel extends Photo {
  const PhotoModel({
    required super.id,
    required super.width,
    required super.height,
    required super.photographer,
    required super.alt,
    required super.url,
    required super.src,
  });

  Map<String, Object> toMap() {
    return {
      "id": id,
      "width": width,
      "height": height,
      'alt': alt,
      'url': alt,
      'photographer': alt,
      'src_original': src.original,
      'src_large': src.large,
      'src_medium': src.medium,
    };
  }

  static Photo fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      width: json['width'] as int,
      height: json['height'] as int,
      photographer: json['photographer'] as String,
      alt: json['alt'] as String,
      url: json['url'] as String,
      src: SrcModel.fromJson(json['src'] as Map<String, dynamic>),
    );
  }
}

class SrcModel extends Src {
  const SrcModel({
    required super.original,
    required super.large,
    required super.medium,
  });
  Map<String, dynamic> toMap() {
    return {
      'original': original,
      'large': large,
      'medium': medium,
    };
  }

  static Src fromJson(Map<String, dynamic> json) {
    return Src(
      original: json['original'] as String,
      large: json['large'] as String,
      medium: json['medium'] as String,
    );
  }
}
