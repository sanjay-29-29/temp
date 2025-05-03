import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

final toaster = CustomToaster();

class CustomToaster {
  static final CustomToaster _instance = CustomToaster._internal();

  /// Private constructor for the singleton class
  CustomToaster._internal();

  /// returns the singleton instance of the class
  factory CustomToaster() => _instance;

  getConfig() {
    return ToastificationConfig(
      alignment: !kIsWeb ? Alignment.bottomCenter : Alignment.topRight,
    );
  }

  showError({required String title, String? msg, Duration? autoCloseDuration}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.minimal,
      title: Text(title),
      description: msg != null ? Text(msg) : null,
      autoCloseDuration: autoCloseDuration ?? Duration(seconds: 3),
    );
  }

  showSuccess(
      {required String title, String? msg, Duration? autoCloseDuration}) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.minimal,
      title: Text(title),
      description: msg != null ? Text(msg) : null,
      autoCloseDuration: autoCloseDuration ?? Duration(seconds: 3),
      borderSide: BorderSide.none,
    );
  }

  showWarning(
      {required String title, String? msg, Duration? autoCloseDuration}) {
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.minimal,
      title: Text(title),
      description: msg != null ? Text(msg) : null,
      autoCloseDuration: autoCloseDuration ?? Duration(seconds: 3),
      borderSide: BorderSide.none,
    );
  }

  showInfo({required String title, String? msg, Duration? autoCloseDuration}) {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.minimal,
      title: Text(title),
      description: msg != null ? Text(msg) : null,
      autoCloseDuration: autoCloseDuration ?? Duration(seconds: 3),
      borderSide: BorderSide.none,
    );
  }
}
