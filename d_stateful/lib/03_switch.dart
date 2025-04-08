import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {

  const SwitchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SwitchState(); // 화살표 함수로 state 처리

}

class _SwitchState extends State<SwitchWidget> {

  // 상태 변수
  late bool _isOn;

  // 상태 변수 초기화
  @override
  void initState() {
    _isOn = false;
    super.initState();
  }

  // 상태 변수 변경
  void _toggle(bool value) {
    setState(() {
      _isOn = value; // 매개변수 value 채우기
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
            value: _isOn,
            onChanged: (bool? value) {
              _toggle(value!);
            },
        ),
        Text("$_isOn"),
      ],
    );
  }
}