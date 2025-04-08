import 'package:flutter/material.dart';

// Wrap
// 자식 위젯들을 여러 줄이나 행으로 배치하는 레이아웃 위젯입니다.
// 공간이 부족해지면 자동으로 다음 줄이나 행으로 위젯을 배치합니다.
// Row나 Column과 달리 화면을 넘어가는 오버플로우를 방지합니다.
// 태그 목록, 동적 크기의 위젯 그룹, 반응형 레이아웃 등을 구현할 때 유용합니다.
// 주요 속성
// 1. children : Wrap 안에 포함되는 자식 위젯들의 목록
// 2. direction : 자식 위젯의 배치 방향 (Axis.horizontal : 좌우로 배치(디폴트), Axis.vertical : 상하로 배치)
// 3. alignment : 자식 위젯의 정렬 방식
// 4. spacing : 자식 위젯 간의 수평 간격
// 5. runSpacing : 자식 위젯 간의 수직 간격

class WrapWidget extends StatelessWidget {

  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // spacing: 20.0,
      // direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: Text("1st Text"),
        ),
        SizedBox(
          width: 200,
          child: Text("2nd Text"),
        ),
        SizedBox(
          width: 200,
          child: Text("3rd Text"),
        ),
        SizedBox(
          width: 200,
          child: Text("4th Text"),
        ),
      ],
    );
  }

}