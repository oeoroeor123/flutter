import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {

  final VoidCallback onPressed;

  const ResetButton({ required this.onPressed, super.key });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("Reset"),
    );
  }
}