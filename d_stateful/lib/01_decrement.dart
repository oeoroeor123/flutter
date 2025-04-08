import 'package:flutter/material.dart';

class DecrementButton extends StatelessWidget {

  final VoidCallback onPressed;

  const DecrementButton({ required this.onPressed, super.key });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("-"),
    );
  }
}