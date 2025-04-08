import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Toast 사용하기
// 플러터에는 기본적으로 내장된 Toast 기능이 없어 fluttertoast 같은 외부 라이브러리를 이용하여 Toast 메시지를 구현할 수 있습니다.
// 구현 순서
// 1. pubspec.yaml 파일에 fluttertoast 라이브러리를 추가합니다.
//   1) dependencies 아래에 fluttertoast: ^8.2.4
//   2) 오른쪽 상단의 Pub get 버튼 클릭 (터미널로 작업하려면 flutter put get 입력)
//   3) 앱 중지 후 재실행
// 2. 코드 작성할 때 fluttertoast 패키지를 import 합니다.
// 3. Fluttertoast.showToast() 메소드를 이용해서 Toast 메시지를 표시합니다.

/* 플러터 라이브러리들의 버전 확인은 pub.dev 사이트에서 할 수 있습니다. */

class ToastWidget extends StatelessWidget {

  const ToastWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed: () {
          Fluttertoast.showToast(
            msg: "Toast 메시지",
            toastLength: Toast.LENGTH_SHORT, // 지속 시간(SHORT or LONG)
            gravity: ToastGravity.BOTTOM,  // 위치 (TOP, CENTER, BOTTOM)
            backgroundColor: Colors.black, // 배경색
            textColor: Colors.white, // 글자색
            fontSize: 16,
          );
        },
        child: const Text("Toast"),
    );
  }
}