import 'package:e_navigator/common/ScaffoldWidget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("메인 페이지"),
            ElevatedButton(
              onPressed: () {
                // 라우트 경로를 이용한 이동
                Navigator.pushNamed(context, "/about");
              },
              child: const Text("어바웃페이지로이동"),
            ),
          ],
        ),
      )
    );
  }

}

class AboutPage extends StatelessWidget {

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("어바웃 페이지"),
            ElevatedButton(
              onPressed: () {
                // 뒤로 가기
                Navigator.pop(context);
              },
              child: const Text("뒤로 가기"))
          ],
        )
      )
    );
  }

}