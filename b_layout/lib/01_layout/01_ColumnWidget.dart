import 'package:flutter/material.dart';

// Column
// 수직 방향(위에서 아래 방향)으로 여러 위젯을 배치하는 레이아웃 위젯입니다.
// 주요 속성
// 1. children : 자식 위젯 목록 (항상 마지막 속성으로 사용)
// 2. mainAxisAlignment : 메인 축(수직 방향) 정렬 방식
// 3. crossAxisAlignment : 교차 축(수평 방향) 정렬 방식
// 4. mainAxisSize : 메인 축 크기 (max : 가능한 모든 공간 사용(디폴트), min : 자식 위젯들의 합계만큼 공간 사용)
// 5. verticalDirection : 자식 위젯의 배치 방향 (down : 위에서 아래로 배치(디폴트), up : 아래서 위로 배치)

class ColumnWidget extends StatelessWidget {

  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      verticalDirection: VerticalDirection.up,
      children: [
        Text("1st Text"),
        Text("2nd Text"),
        Text("3rd Text"),
      ],
    );
  }

}