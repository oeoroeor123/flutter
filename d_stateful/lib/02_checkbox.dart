import 'package:flutter/material.dart';

// Switch
// on/off 상태를 나타내는 위젯으로 특정 기능의 활성화/비활성화를 나타낼 때 사용
class CheckboxWidget extends StatefulWidget {

  const CheckboxWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CheckboxState();
  }
}

class _CheckboxState extends State<CheckboxWidget> {

  // 상태 변수
  late bool _isChecked;

  // 상태 변수 초기화를 위한 initState() 메소드
  @override
  void initState() {
    _isChecked = false;
    super.initState();
  }

  // ui 빌드
  @override
  Widget build(BuildContext context) {
    // 1. checkbox와 text 따로 만들기
    /*
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: _isChecked, // 체크 박스 상태 값
            onChanged: (bool? value) { // 매개변수 value = 현재 체크 박스의 체크 여부 상태
              setState(() { // ssetState() 처리로 상태 저장
              _isChecked = value!; // !를 붙여 value는 null이 아님을 단언
              // _isChecked = value ?? false; // null일 경우 false 로 처리
              });
            },
        ),
        Text("$_isChecked"),
      ],
    );
  }
  */

    // 2. checkbox와 text가 하나로 관리되는 CheckboxListTile
    return CheckboxListTile(
      title: Text("$_isChecked"),
      controlAffinity: ListTileControlAffinity.leading, // 체크 박스 위치 조정 (앞, 뒤)
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value!;
        });
      },
    );
  }
}