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

## To Do / Roadmap

**Version 1.0.0**
- [ ] using http instead of dio to send to telegram

## Information

[Github Repo](https://github.com/serapion123321/error_handler_2)
