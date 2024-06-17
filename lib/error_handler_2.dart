library error_handler_2;

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:error_handler_2/application/core/var.dart';
import 'package:flutter/foundation.dart';

class ErrorHandler {
  /// Function when something error
  /// 200 OK - The request has succeeded.
  /// 201 Created - The request has been fulfilled and a new resource has been created.
  /// 204 No Content - The server successfully processed the request but there is no content to return.
  /// 400 Bad Request - The server cannot process the request due to a client error.
  /// 401 Unauthorized - The request requires user authentication.
  /// 403 Forbidden - The server understood the request, but refuses to authorize it.
  /// 404 Not Found - The server cannot find the requested resource.
  /// 405 Method Not Allowed - The request method is not supported for the requested resource.
  /// 500 Internal Server Error - The server encountered an unexpected condition which prevented it from fulfilling the request.
  /// 503 Service Unavailable - The server is currently unable to handle the request due to temporary overloading or maintenance of the server.

  Future<void> errorReport({
    DioException? dioException,
    Function(DioException er)? serverErrorHandler,
    Function(DioException er)? notFoundErrorHandler,
    Function(DioException er)? badRequestHandler,
    Function(DioException er)? forbiddenErrorHandler,
    Function(DioException er)? timeoutErrorHandler,
    Function(DioException er)? unauthorizedErrorHandler,
    Function(DioException er)? unexpectedErrorHandler,
  }) async {
    try {
      switch (dioException?.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:

          /// connection timeout from client
          timeoutErrorHandler;
          sendTelegram(
              tokenPrivate: ErrorHandlerVar.tokenTelegramPrivate,
              chatId: ErrorHandlerVar.chatIdTelegram,
              url: dioException?.response?.requestOptions.path,
              statusCode: 0,
              statusMessage: "ServerTimeOut",
              statusNote: "Server Time Out With Type : ${dioException?.type}",
              device: ErrorHandlerVar.device,
              appVersion: ErrorHandlerVar.appVersion,
              env: kDebugMode ? "Debug" : "Release",
              paramBody: '');
          break;
        case DioExceptionType.badResponse:

          /// use dioError if not null
          if (dioException?.error != null) {
            if (dioException?.response?.statusCode == 500 ||
                dioException?.response?.statusCode == 502 ||
                dioException?.response?.statusCode == 503 ||
                dioException?.response?.statusCode == 504) {
              /// 500 || 502 || 504
              serverErrorHandler;
            } else if (dioException?.response?.statusCode == 400) {
              /// 400
              badRequestHandler;
            } else if (dioException?.response?.statusCode == 404) {
              /// 404
              notFoundErrorHandler;
            } else if (dioException?.response?.statusCode == 403) {
              /// 403
              forbiddenErrorHandler;
            } else if (dioException?.response?.statusCode == 401) {
              /// 401
              unauthorizedErrorHandler;
            } else {
              unexpectedErrorHandler;
            }
            if (kDebugMode) {
              log("DioError type: ${dioException?.type}");
            }
            if (ErrorHandlerVar.isSendToTelegram) {
              if (ErrorHandlerVar.tokenTelegramPrivate != '' &&
                  ErrorHandlerVar.chatIdTelegram != '') {
                sendTelegram(
                    tokenPrivate: ErrorHandlerVar.tokenTelegramPrivate,
                    chatId: ErrorHandlerVar.chatIdTelegram,
                    url: dioException?.response?.requestOptions.path,
                    statusCode: dioException?.response?.statusCode ?? 0,
                    statusMessage:
                        dioException?.response?.data ?? "Tidak ada pesan error",
                    statusNote: dioException?.message,
                    device: ErrorHandlerVar.device,
                    appVersion: ErrorHandlerVar.appVersion,
                    env: kDebugMode ? "Debug" : "Release",
                    paramBody:
                        dioException?.response?.requestOptions.data.toString());
              } else {
                log("Token Telegram Or chat Id Telegram was not set");
              }
            }
          } else {
            log("DioError type: ${dioException?.type}");
            if (ErrorHandlerVar.isSendToTelegram) {
              if (ErrorHandlerVar.tokenTelegramPrivate != '' &&
                  ErrorHandlerVar.chatIdTelegram != '') {
                sendTelegram(
                    tokenPrivate: ErrorHandlerVar.tokenTelegramPrivate,
                    chatId: ErrorHandlerVar.chatIdTelegram,
                    url: '',
                    statusCode: 0,
                    statusMessage: "Unexpected Error has occured",
                    statusNote: dioException?.message,
                    device: ErrorHandlerVar.device,
                    appVersion: ErrorHandlerVar.appVersion,
                    env: kDebugMode ? "Debug" : "Release",
                    paramBody: '');
              } else {
                log("Token Telegram Or chat Id Telegram was not set");
              }
            }
          }
          break;
        case DioExceptionType.unknown:
          if (dioException?.error != null) {
            if (ErrorHandlerVar.isSendToTelegram) {
              if (ErrorHandlerVar.tokenTelegramPrivate != '' &&
                  ErrorHandlerVar.chatIdTelegram != '') {
                sendTelegram(
                    tokenPrivate: ErrorHandlerVar.tokenTelegramPrivate,
                    chatId: ErrorHandlerVar.chatIdTelegram,
                    url: dioException?.response?.requestOptions.path,
                    statusCode: dioException?.response?.statusCode ?? 0,
                    statusMessage: "Unexpected Error has occured",
                    statusNote: dioException?.message,
                    device: ErrorHandlerVar.device,
                    appVersion: ErrorHandlerVar.appVersion,
                    env: kDebugMode ? "Debug" : "Release",
                    paramBody: '');
              } else {
                log("Token Telegram Or chat Id Telegram was not set");
              }
            }
          } else {
            if (ErrorHandlerVar.isSendToTelegram) {
              if (ErrorHandlerVar.tokenTelegramPrivate != '' &&
                  ErrorHandlerVar.chatIdTelegram != '') {
                sendTelegram(
                    tokenPrivate: ErrorHandlerVar.tokenTelegramPrivate,
                    chatId: ErrorHandlerVar.chatIdTelegram,
                    url: '',
                    statusCode: 0,
                    statusMessage: "Unexpected Error has occured",
                    statusNote: dioException?.message,
                    device: ErrorHandlerVar.device,
                    appVersion: ErrorHandlerVar.appVersion,
                    env: kDebugMode ? "Debug" : "Release",
                    paramBody: '');
              }
            }
          }
        default:
          log("DioError type: ${dioException?.type}");
          if (ErrorHandlerVar.isSendToTelegram) {
            if (ErrorHandlerVar.tokenTelegramPrivate != '' &&
                ErrorHandlerVar.chatIdTelegram != '') {
              sendTelegram(
                  tokenPrivate: ErrorHandlerVar.tokenTelegramPrivate,
                  chatId: ErrorHandlerVar.chatIdTelegram,
                  url: '',
                  statusCode: 0,
                  statusMessage: "Unexpected Error has occured",
                  statusNote: dioException?.message,
                  device: ErrorHandlerVar.device,
                  appVersion: ErrorHandlerVar.appVersion,
                  env: kDebugMode ? "Debug" : "Release",
                  paramBody: '');
            }
          }
      }
    } catch (er) {
      log("Error Report Failed, Error: $er");
    }
  }

  Future<void> sendTelegram(
      /// Function to send chat to telegram
      {url,
      statusCode,
      statusMessage,
      statusNote,
      String? paramBody,
      String? device,
      String? appVersion,
      String? env,
      required String tokenPrivate,
      required String chatId}) async {
    try {
      Dio().post(
        "https://api.telegram.org/$tokenPrivate/sendMessage?chat_id=$chatId&text=url: <b>$url</b>;\nerror_code: <b>$statusCode</b>;\nerror_message: <b>$statusMessage</b>;\nerror_note: <b>$statusNote</b>;\ndevice: <b>$device</b>;\nappVersion: <b>$appVersion</b>;\nenv: <b>$env</b>;\nparamBody: <b>$paramBody</b>;&parse_mode=html",
      );
    } catch (er) {
      log(er.toString());
    }
  }

  Future<void> sendDocument(
      /// Function to send document to telegram
      {url,
      required String path,
      required String tokenPrivate,
      required String chatId}) async {
    try {
      FormData formData = FormData.fromMap({
        "chat_id": ErrorHandlerVar.chatIdTelegram,
        "document": await MultipartFile.fromFile(path, filename: path),
      });
      await Dio()
          .post(
              "https://api.telegram.org/${ErrorHandlerVar.tokenTelegramPrivate}/sendDocument",
              data: formData)
          .then((value) {
        log(value.toString());
      });
    } catch (er) {
      log(er.toString());
    }
  }
}
