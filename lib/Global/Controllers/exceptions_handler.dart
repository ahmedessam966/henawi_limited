import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class LoginExceptionControllers {
  static Future handleIncomingStatusCode(int status, BuildContext context) async {
    switch (status) {
      case 200:
        return true;

      case 201:
        return true;

      case 400:
        return Flushbar(
          title: 'Invalid email or password',
          titleColor: Colors.red,
          message: 'Please check the email or password entered (Error 400)',
          duration: const Duration(seconds: 7),
        ).show(context);

      case 404:
        return Flushbar(
          title: 'Error',
          titleColor: Colors.red,
          message: 'The repository could not be found (Error 404)',
          duration: const Duration(seconds: 7),
        ).show(context);

      case 403:
        return Flushbar(
          title: 'Insufficient Privilege',
          titleColor: Colors.red,
          message: 'You do not have an access permission for this operation (Error 403)',
          duration: const Duration(seconds: 7),
        ).show(context);

      case 408:
        return Flushbar(
          title: 'Connection Error',
          titleColor: Colors.red,
          message: 'Request time out. Please check your connection and try again (Error 408)',
          duration: const Duration(seconds: 7),
        ).show(context);

      case 0:
        return Flushbar(
          title: 'Connection Error',
          titleColor: Colors.red,
          message: 'Request time out. Please check your connection and try again (Error 408)',
          duration: const Duration(seconds: 7),
        ).show(context);

      default:
        return Flushbar(
          title: 'Unknown Error',
          titleColor: Colors.red,
          message: 'Unexcpected error (Error 500)',
          duration: const Duration(seconds: 7),
        ).show(context);
    }
  }
}

class DatabaseExceptionsControllers {
  static Future handleDatabaseExceptions(BuildContext context, int statusCode) async {
    switch (statusCode) {
      case 400:
        return Flushbar(
          title: 'Fetching Error',
          titleColor: Colors.red,
          message: 'Invalid search filter parameters (Error 400)',
          duration: const Duration(seconds: 7),
        ).show(context);
      case 404:
        return Flushbar(
          title: 'Not Found',
          titleColor: Colors.red,
          message: 'The requested resource or assets could not be found (Error 404)',
          duration: const Duration(seconds: 7),
        ).show(context);
      case 0:
        return Flushbar(
          title: 'Connection Error',
          titleColor: Colors.red,
          message: 'Could not establish a connection to host servers (Error 0)',
          duration: const Duration(seconds: 7),
        ).show(context);
    }
  }
}
