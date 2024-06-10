import 'package:error_handler_2/application/core/var.dart';

class Initialization{

  Future<void> setTelegram(String tokenTelegramPrivate, String chatIdTelegram, bool isSendToTelegram) async {
    ErrorHandlerVar.tokenTelegramPrivate = tokenTelegramPrivate;
    ErrorHandlerVar.chatIdTelegram = chatIdTelegram;
    ErrorHandlerVar.isSendToTelegram = isSendToTelegram;
  }

  Future<void> setDeviceData(String device, String appVersion) async {
    ErrorHandlerVar.device = device;
    ErrorHandlerVar.appVersion = appVersion;
  }

  Future<void> setErrorMessageFromBackend(String e) async {
    ErrorHandlerVar.errorMessageFromBackend = e;
  }

  Future<void> setServerErrorHandler(Function setServerErrorHandler) async {
    ErrorHandlerVar.serverErrorHandler = setServerErrorHandler;
  }

  Future<void> setBadRequestHandler(Function setBadRequestHandler) async {
    ErrorHandlerVar.badRequestHandler = setBadRequestHandler;
  }

  Future<void> setNotFoundErrorHandler(Function setNotFoundErrorHandler) async {
    ErrorHandlerVar.notFoundErrorHandler = setNotFoundErrorHandler;
  }

  Future<void> setForbiddenErrorHandler(Function setForbiddenErrorHandler) async {
    ErrorHandlerVar.forbiddenErrorHandler = setForbiddenErrorHandler;
  }

  Future<void> setUnauthorizedErrorHandler(Function setUnauthorizedErrorHandler) async {
    ErrorHandlerVar.unauthorizedErrorHandler = setUnauthorizedErrorHandler;
  }

  Future<void> setUnexpectedErrorHandler(Function setUnexpectedErrorHandler) async {
    ErrorHandlerVar.unexpectedErrorHandler = setUnexpectedErrorHandler;
  }
}