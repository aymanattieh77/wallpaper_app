import 'package:dio/dio.dart';
import 'package:wallpaper_app/data/error/failure.dart';

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(ServerMessages.connectionTimeout);

      case DioExceptionType.sendTimeout:
        return const ServerFailure(ServerMessages.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(ServerMessages.receiveTimeout);
      case DioExceptionType.badCertificate:
        return const ServerFailure(ServerMessages.badCertificate);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure(ServerMessages.cancelServer);
      case DioExceptionType.connectionError:
        return const ServerFailure(ServerMessages.connectionError);
      case DioExceptionType.unknown:
        return const ServerFailure(ServerMessages.unknownError);
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return const ServerFailure(ServerMessages.notFoundError);
    } else if (statusCode == 500) {
      return const ServerFailure(ServerMessages.serverError);
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return const ServerFailure(ServerMessages.serverError);
    } else {
      return const ServerFailure(ServerMessages.unknownError);
    }
  }
}

abstract class ServerMessages {
  static const internetConnectionError = 'Check your internet connection';
  static const tryAgain = 'Try Again';
  static const somthingWentWrong = 'Something Went Wrong';
  static const connectionTimeout = 'Connection Timeout With Server';
  static const sendTimeout = 'Send Timeout With Server';
  static const receiveTimeout = 'Receive Timeout With Server';
  static const badCertificate = 'Bad Certificate With Server';
  static const cancelServer = 'Request To Server Was Canceld';
  static const connectionError = 'No Internet Connection';
  static const unknownError = 'Opps There Was An Error';
  static const notFoundError = 'Your Request Was Not Found';
  static const serverError = 'Server Error';
}
