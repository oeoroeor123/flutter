import 'package:flutter/material.dart';

// Icon
// 아이콘을 화면에 표시하는 위젯입니다.
// Material Design 아이콘 세트를 이용해 다양한 위젯을 제공합니다.
// 아래의 사이트로 이동하면 아이콘의 목록을 확인할 수 있다.
// https://api.flutter.dev/flutter/material/Icons-class.html
// 주요 속성
// 1. size : 크기
// 2. color : 색상
// 3. semanticLabel : 앱 접근성 향상을 위해서 필요한 아이콘 설명
//                    아이콘 설명을 추가해 놓으면 스크린 리더가 이를 읽음

class IconWidget extends StatelessWidget {

  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return const Icon(
      Icons.star,
      size: 124.0,
      color: Colors.amber,
      semanticLabel: 'star icon', // 아이콘에 대한 설명 추가
    );
  }
}