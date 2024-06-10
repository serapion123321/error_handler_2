import 'package:dio/dio.dart';

class ErrorHandlerVar{
  /// Send To Telegram
  static bool isSendToTelegram = false;

  /// Key
  static String tokenTelegramPrivate = '';
  static String chatIdTelegram = '';
  static String errorMessageFromBackend = '';

  /// Device Data
  static String device = '';
  static String appVersion = '';

  /// Function StandAlone
  static Function serverErrorHandler = (DioException er){};
  static Function badRequestHandler = (DioException er){};
  static Function notFoundErrorHandler = (DioException er){};
  static Function forbiddenErrorHandler = (DioException er){};
  static Function unauthorizedErrorHandler = (DioException er){};
  static Function unexpectedErrorHandler = (DioException er){};
}