import 'package:flutter/material.dart';

// SnackBar
// 화면 하단에 잠시 동안 메시지를 표시하는 간단한 방법입니다.
// 주로 사용자에게 피드백을 제공하거나 일시적인 정보를 보여주는 용도로 사용합니다.
// 원래 앱 개발에서는 Toast 형태로 많이 제공하는 기능인데 Flutter에서는 Toast를 기본적으로 지원하지는 않습니다.
// SnackBar를 화면에 표시하기 위해서는 ScaffoldMessenger를 기본적으로 사용해야 합니다.
// 주요 속성
// 1. content : 화면에 보여줄 내용
// 2. duration : 화면에 보여줄 시간
// 3. action : 액션 버튼 추가 (사용자의 액션을 처리할 수 있음)

class SnackBarWidget extends StatelessWidget {

  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title:const Text("SnackBar 표시"),
      onTap: () { // tap(클릭)해야 동작하도록 처리
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("간단한 스낵바 알림"),
            action: SnackBarAction(
                label: "스낵바 알림 내부 이벤트",
                onPressed: () {
                  print("스낵바 알림 중 메시지");
                }
            ),
            duration: const Duration(seconds: 5), // 5초 후 스낵바 메시지 닫도록 처리
          )
        );
      },
    );
  }
}