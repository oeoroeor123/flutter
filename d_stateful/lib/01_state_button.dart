import 'package:flutter/material.dart';

class StateButton extends StatelessWidget {

  final VoidCallback onPressed;
  final int type;

  const StateButton({ required this.onPressed, required this.type, super.key });

  // 증가, 감소, 리셋 버튼의 처리 내용이 동일하니 하나로 묶어서 아래와 같이 처리한다.
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onPressed,
    child: Text(type == 1 ? "+" : type == 2 ? "-" : "Reset"),
    );
  }
}