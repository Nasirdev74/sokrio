import 'package:flutter/material.dart';

class AppFeedback {
  static showErrorMessage({
    required String title,
    required String message,
  }) {}

  static showShortMessage({
    required Widget message,
  }) {}

  static showSnackFeedback({
    required bool isSuccess,
    required String message,
  }) {}
}
