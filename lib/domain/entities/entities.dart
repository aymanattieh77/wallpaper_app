import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final int width;
  final int height;
  final String photographer;
  final String alt;
  final String url;
  final Src src;
  const Photo(
      {required this.id,
      required this.width,
      required this.height,
      required this.photographer,
      required this.alt,
      required this.url,
      required this.src});

  @override
  List<Object> get props {
    return [
      id,
      width,
      height,
      photographer,
      alt,
      url,
      src,
    ];
  }
}

class Src extends Equatable {
  final String original;
  final String large;
  final String medium;
  const Src({
    required this.original,
    required this.large,
    required this.medium,
  });

  @override
  List<Object> get props => [original, large, medium];
}
