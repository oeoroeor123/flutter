import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {

  const SliderWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SliderState();
}

class _SliderState extends State<SliderWidget> {

  // 상태 변수
  double _score = 0; // initState() 상태 변수 초기화 메소드 호출 생략 가능

  // 상태 변수 변경
  void _setScore(double score) {
    setState(() {
      _score = score; // 상태 변수에 매개변수 score 값 채우기
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${_score.toInt()}"), // .toInt() 소수점 없애고 정수로 노출
        Slider(
          min: 0, // 슬라이더 최소 값
          max: 100, // 슬라이더 최대 값
          divisions: 100, // 슬라이더 움직임 제한
          value: _score,
          onChanged: (double value) {
           _setScore(value!);
          }
        ),
      ],
    );
  }
}