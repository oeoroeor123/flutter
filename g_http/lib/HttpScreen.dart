import 'dart:convert';  // 문자열 형식의 JSON 데이터 디코딩 (문자열 -> JSON 데이터 변경)

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpScreen extends StatefulWidget {
  const HttpScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HttpState();
}

class _HttpState extends State<HttpScreen> {

  // 이름(영문만 가능)을 전달하면 해당 이름을 가진 인원 수와 추정 나이를 반환하는 간단한 API
  final String url = "https://api.agify.io?name=";

  // 요청 변수 (상태 변수)
  late String _name = "";

  // 응답 변수 (상태 변수)
  int count = 0;
  int age = 0;

  // API 요청을 수행하는 함수
  void callAPI(String? name) async {
    setState(() {
      _name = name!;
    });
    if(name != null && name.isNotEmpty) {
      final response = await http.get(Uri.parse("$url$_name"));  // GET 방식으로 API 요청
      if(response.statusCode == 200) {  // 요청과 응답 성공
        // response.body : 응답 결과 (문자열 형식의 JSON 데이터)
        // json.decode(response.body) : JSON 데이터로 변환된 응답 결과 (타입 : dynamic)
        final dynamic jsonData = json.decode(response.body);  // jsonData 는 Map 타입으로 처리
        setState(() {
          count = jsonData["count"];
          age = jsonData["age"];
        });
      } else {
        setState(() {  // 요청 실패 시 count / age 모두 0으로 처리
          count = 0;
          age = 0;
        });
      }
    }
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("http")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 응답 결과 count, age 표시
          SizedBox(
            height: 200,
            child: Center(
              child: Text(
                "이름 = $_name\n추정 인원 = $count명\n추정 나이 = $age살",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Form 표시 (이름 입력 및 API 호출 버튼)
          _FormWidget(onSaved: callAPI),  // callAPI() 함수 전달
        ],
      ),
    );

  }

}

// 사용자로부터 이름을 입력 받는 Form 을 반환하는 위젯
class _FormWidget extends StatelessWidget {

  // callAPI() 함수를 전달 받는 필드
  final Function(String?) onSaved;

  _FormWidget({ required this.onSaved, super.key });

  // Form 상태(FormState)를 관리하는 GlobalKey 생성
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,  // Form 에 GlobalKey (_formKey) 등록
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Input name",
                ),
                validator: (String? value) {
                  // 빈 문자열 검사
                  if(value == null || value.isEmpty) {
                    return "Please input name";
                  }
                  // 영문 입력 검사
                  final RegExp regExp = RegExp(r"^[A-Za-z]+$");  // r : Raw String, 문자열 내의 모든 문자를 문자 그대로 사용(이스케이프 무시)
                  if(!regExp.hasMatch(value)) {
                    return "Please input english name";
                  }
                  return null;  // 유효성 검사 통과
                },
                onSaved: onSaved,
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  // 입력 데이터 검증 후 저장
                  if(_formKey.currentState!.validate()) {  // 입력 필드의 validator 콜백 호출
                    _formKey.currentState!.save();  // 입력 필드의 onSaved 콜백 호출
                  }
                },
                child: const Text("API 요청"),
              ),
            )
          ],
        )
    );
  }

}