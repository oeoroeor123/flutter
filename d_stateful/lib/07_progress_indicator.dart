import 'package:flutter/material.dart';

// ProgressIndicator
// 작업의 진행 상태를 시각적으로 표시하는 위젯입니다.
// CircularProgressIndicator(원형) 와 LinearProgressIndicator(수평 막대) 가 있습니다.

class ProgressIndicatorWidget extends StatefulWidget {

  const ProgressIndicatorWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ProgressIndicatorState();

}

class _ProgressIndicatorState extends State<ProgressIndicatorWidget> {

  // 상태 변수
  late double _value;

  // 초기화
  @override
  void initState() {
    _value = 0.0;
    super.initState();
  }

  // 상태 변수 증가
  void _increment() {
    setState(() {
      _value = _value >= 1.0 ? 1.0 : _value + 0.1;
    });
  }

  // 상태 변수 감소
  void _decrement() {
    setState(() {
      _value = _value <= 0.0 ? 0.0 : _value - 0.1;
    });
  }

  // 상태 변수 리셋
  void _reset() {
    setState(() {
      _value = 0.0;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(dimension: 10.0),
        CircularProgressIndicator(
          value: _value,
          strokeWidth: 10,
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        SizedBox.square(dimension: 10.0),
        LinearProgressIndicator(
          value: _value,
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        SizedBox.square(dimension: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _increment,
              child: const Text("+"),
            ),
            SizedBox.square(dimension: 5.0),
            ElevatedButton(
              onPressed: _decrement,
              child: const Text("-"),
            ),
            SizedBox.square(dimension: 5.0),
            ElevatedButton(
              onPressed: _reset,
              child: const Text("Reset"),
            ),
          ],
        )
      ],
    );
  }

}