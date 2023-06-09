import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

snackBarShowSuccess(String title, String message, BuildContext context) {
  ElegantNotification.success(title: Text(title), description: Text(message))
      .show(context);
}

snackBarShowError(String title, String message, BuildContext context) {
  ElegantNotification.error(title: Text(title), description: Text(message))
      .show(context);
}
