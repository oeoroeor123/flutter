import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {

  const TextFieldWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TextFieldState();

}

class _TextFieldState extends State<TextFieldWidget> {

  // 입력 컨트롤러
  final TextEditingController _controller = TextEditingController();

  // 상태 변수
  String _text = "";

  // 상태 변수 초기화
  @override
  void initState() {
    super.initState();
    _controller.addListener(_convertToLowerCase);  // 입력이 될 때마다 _convertToLowerCase 동작
  }

  // 자원 정리 함수 (리스너 해제 및 컨트롤러 해제)
  @override
  void dispose() {
    _controller.removeListener(_convertToLowerCase);
    _controller.dispose();
    super.dispose();
  }

  // 대문자를 소문자로 변경
  void _convertToLowerCase() {
    // TextField 에 입력한 텍스트
    final lowerText = _controller.text.toLowerCase();
    // TextField 의 내용이 변경되었는지 체크
    if(lowerText != _controller.text) {
      _controller.value = _controller.value.copyWith(
        text: lowerText,
        selection: TextSelection.collapsed(offset: lowerText.length),
      );
    }
    // 상태 업데이트
    _setText(lowerText);
  }

  // 상태 변수 변경
  void _setText(String text) {
    setState(() {
      _text = text;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("입력한 텍스트 = $_text"),
        SizedBox(
          width: 300,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),  // OutlineInputBorder(), InputBorder.none,
              // hintText: "이름",
              labelText: "이름",
            ),
            // onChanged : 입력할때마다, onSubmitted : 입력 후 엔터 누를 때
            onSubmitted: (String? value) {
              _setText(value!);
            },
          ),
        ),
      ],
    );
  }

}