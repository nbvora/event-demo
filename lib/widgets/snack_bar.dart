import 'package:flutter/material.dart';

class SnackBarWidget {
  final String message;

  const SnackBarWidget({required this.message});

  static show(BuildContext context, String message,
      {bool isSuccessMessage = false}) {
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0.0,
        content: Text(message),
        duration: const Duration(seconds: 7),
        backgroundColor: Colors.green));
  }
}
