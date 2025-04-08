import 'package:e_navigator/common/ScaffoldWidget.dart';
import 'package:flutter/material.dart';

class ArgumentsPage extends StatelessWidget {

  const ArgumentsPage({super.key});

  @override
  Widget build(BuildContext context) {

    // RouteSettings
    // 라우트(페이지)에 대한 정보를 담고 있는 클래스입니다.
    // 이 클래스는 주로 네비게이션 과정에서 라우트에 대한 추가적인 정보를 전달하는 데 사용합니다.
    // 주요 속성
    // name : 라우트 이름. 주로 네임드 라우터에서 사용
    // arguments : 라우트로 전달할 추가적인 데이터

    final RouteSettings settings = ModalRoute.of(context)!.settings;
    final String? routeName = settings.name;  // "/arguments"
    final Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;  // {"name": "tom", "age": 30}
    final String name = arguments["name"];
    final int age = arguments["age"];

    return ScaffoldWidget(
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("요청 주소 : $routeName, 이름 : $name, 나이 : $age"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("뒤로 가기"),
            ),
          ],
        ),
      )
    );

  }

}