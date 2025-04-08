import 'package:flutter/material.dart';

// Padding
// 자식 위젯 주변에 여백을 추가하는데 사용되는 레이아웃 위젯입니다.
// Padding은 자식 위젯을 감싸고 그 주위에 지정된 크기의 빈 공간을 만듭니다.
// 위젯 사이의 간격을 조절하거나 위젯과 화면 경계 간의 여백을 설정하여 UI를 더 깔끔하게 만들 수 있습니다.

class PaddingWidget extends StatelessWidget {

  final double size;

  // PaddingWidget(size: 20) 과 같은 방식으로 생성자를 호출해야 합니다.
  const PaddingWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size),
      child: const Text("Padding's child"),
    );
  }

}