import 'package:flutter/material.dart';

class CustomDialogBox {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    String? subMessage,
    required String message,
    required VoidCallback onSubmit,
    VoidCallback? onCancel, // Add optional onCancel parameter
    bool showCancelButton = true, // New boolean parameter, default is true
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message, style: Theme.of(context).textTheme.bodyLarge),
                if (subMessage != null) // Check if subMessage is not null
                ...[
                  const SizedBox(height: 10),
                  Text(
                    subMessage,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ],
            ),
          ),
          actions: <Widget>[
            if (showCancelButton) // Show Cancel button only if showCancelButton is true
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  onCancel?.call();
                },
              ),
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.green)),
              onPressed: () {
                Navigator.pop(context);
                onSubmit();
              },
            ),
          ],
        );
      },
    );
  }
}
