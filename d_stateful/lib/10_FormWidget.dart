import 'package:flutter/material.dart';

// Form
//
// 개념
// 여러 입력 필드를 그룹화하여 사용자로부터 데이터를 수집할 수 있도록 하는 위젯입니다.
// Form 위젯은 TextFormField 와 같은 입력 필드와 함께 사용됩니다.
// 사용자 입력을 관리하고 검증하는데 사용되는 중요한 위젯입니다.
//
// 주요 특징
// 1. StatefulWidget : Form 은 상태를 가지는 위젯입니다. FormState 객체를 통해 관리됩니다.
// 2. 그룹화 : 여러 FormField 위젯을 하나의 그룹으로 묶어 관리할 수 있습니다.
// 3. 유효성 검사 : FormState 를 통해 모든 자식 FormField 의 유효성을 한 번에 검사할 수 있습니다.
// 4. GlobalKey 사용 : Form 에 GlobalKey 를 할당하여 FormState 에 접근하고 메소드를 호출할 수 있습니다.
// 5. 컨테이너 역할 : Form 은 컨테이너처럼 동작하며, 여러 입력 필드를 포함할 수 있습니다.
//
// 주요 속성
// key : Form 의 고유 키를 설정
// autovalidateMode : 입력 필드의 자동 유효성 검사 모드를 설정
// child : Form 안에 포함될 자식 위젯

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});
  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<FormWidget> {

  // GlobalKey 에 FormState 를 할당하고 이 키를 Form 의 key 로 등록하면 Form 의 각종 상태 변화를 추적할 수 있습니다.
  // Flutter 에서는 위젯 트리가 변경될 때마다 새로 빌드되므로, 일반적인 방식으로는 특정 위젯의 상태를 유지하거나 추적하기 어렵습니다.
  // GlobalKey 는 위젯 트리 전체에서 고유성을 보장하며, 이를 통해 특정 위젯(여기서는 Form)의 상태를 안전하게 관리할 수 있습니다.
  final _formKey = GlobalKey<FormState>();

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,  // 폼 유효성 검사, 폼 입력 데이터 저장, 폼 초기화 등
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "이름",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "이름 입력 필요";
                }
                return null;  // 유효성 검사 통과를 의미함
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 현재 Form 의 상태를 확인하여 모든 TextFormField 위젯의 유효성을 검사합니다.
                // 각 입력 필드의 validator() 함수를 호출하여 유효성 검사를 진행하고,
                // 모든 입력 필드가 통과하면 true, 아니면 false 를 반환합니다.
                if(_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("입력 확인"))
                  );
                }
              },
              child: const Text("제출")
            ),
          ],
        ),
      ),
    );
  }

}