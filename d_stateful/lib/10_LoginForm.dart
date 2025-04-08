import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  late String id;
  late String pw;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    id = "";
    pw = "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _TextFormField(
              isObscure: false,
              onSaved: (String? value) {
                id = value!;
              },
            ),
            SizedBox(height: 20),
            _TextFormField(
              isObscure: true,
              onSaved: (String? value) {
                pw = value!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Form 유효성 검사
                if(_formKey.currentState!.validate()) {
                  // Form 저장
                  // Form 내부의 모든 입력 필드의 onSaved 콜백 함수를 호출하여 처리합니다.
                  _formKey.currentState!.save();
                  // UI 업데이트
                  setState(() { });
                }
              },
              child: const Text("로그인"),
            ),
            Row(
              children: [
                Text("아이디 : $id"),
                SizedBox(width: 20),
                Text("비밀번호 : $pw"),
              ],
            )
          ],
        )
      ),
    );
  }

}

class _TextFormField extends StatelessWidget {

  final bool isObscure;
  final Function(String?) onSaved;

  const _TextFormField({
    required this.isObscure,
    required this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: isObscure ? "비밀번호" : "아이디",
      ),
      validator: (String? value) {
        if(value == null || value.isEmpty) {
          return isObscure ? "비밀번호 입력 필요" : "아이디 입력 필요";
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

}










