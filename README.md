## Description

Flutter error handler 2, is simple plugin to easily handle error in repository area. it can send error to telegram to make developer know something happen to their app

## Vision

> Fast and Easy to know error in production without complicated

## Getting started

use Initialization.setTelegram to activate optional feature to send error to telegram. log error will be default when in debug mode.

```dart  
Future<void> setTelegram(String tokenTelegramPrivate, String chatIdTelegram, bool isSendToTelegram) async {
    ErrorHandlerVar.tokenTelegramPrivate = tokenTelegramPrivate;
    ErrorHandlerVar.chatIdTelegram = chatIdTelegram;
    ErrorHandlerVar.isSendToTelegram = isSendToTelegram;
  }
```  

you can set device data to know user device when it come to error. Make it easy to analyze.

```dart
  Future<void> setDeviceData(String device, String appVersion) async {
    ErrorHandlerVar.device = device;
    ErrorHandlerVar.appVersion = appVersion;
  }
```

using standalone function to send to telegram

```dart

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


```

## To Do / Roadmap

**Version 1.0.0**
- [ ] using http instead of dio to send to telegram

## Information

[Github Repo](https://github.com/serapion123321/error_handler_2)
