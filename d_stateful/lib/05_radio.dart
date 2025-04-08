import 'package:flutter/material.dart';

// statefulWidget 클래스 생성
class RadioWidget extends StatefulWidget {

  // 생성자 주입
  const RadioWidget({super.key});

  // state 생성
  @override
  State<StatefulWidget> createState() => _RadioState();

}

// 열거형 정의 (사용 방법 : Gender.Man, Gender.Woman)
enum Gender {Man, Woman}

// State 클래스 생성
class _RadioState extends State<RadioWidget> {

  // 상태 변수
  Gender? _gender; // ? 로 nullable 처리 시 initState()로 상태 초기화 하지 않아도 됌

  // 상태 변수 변경
  void _changeGender(Gender value) {
    setState(() {
      _gender = value;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text("Man"),
          value: Gender.Man, // 상태 변수 중에서 Man만 지정
          groupValue: _gender,
          onChanged: (Gender? value) {
            _changeGender(value!);
          }
        ),
        RadioListTile(
            title: Text("Woman"),
            value: Gender.Woman, // 상태 변수 중에서 Woman만 지정
            groupValue: _gender,
            onChanged: (Gender? value) {
              _changeGender(value!);
            }
        ),
      ],
    );
  }
}