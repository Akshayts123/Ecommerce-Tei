import 'package:flutter/material.dart';

customDialogueLoading(BuildContext context) => showDialog(
  barrierDismissible: false,
  context: context,
  builder: (_) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      title: const Text('Fetching location data. Please wait...'),
      content: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        child: const CircularProgressIndicator(),
      ),
    );
  },
);