import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpaper_app/data/error/failure.dart';

abstract class BaseUsecase<Output, Param> {
  Future<Either<Failure, Output>> call(Param param);
}

class NoParam extends Equatable {
  const NoParam();
  @override
  List<Object?> get props => [];
}
