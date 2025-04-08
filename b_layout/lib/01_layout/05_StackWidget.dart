import 'package:flutter/material.dart';

// Stack
// 여러 위젯을 겹쳐서 배치할 수 있게 해 주는 레이아웃 위젯입니다.
// 자식 위젯들을 겹쳐서 배치하는 오버레이(Overlay) 구조를 가집니다.
// 리스트의 첫 위젯이 맨 뒤로 가고, 리스트의 마지막 위젯이 맨 앞으로 옵니다.
// 주요 속성
// 1. children : Stack 내부에 포함될 자식 위젯 목록
// 2. alignment : 자식 위젯들의 배치 위치를 지정
// 3. fit : 자식 위젯들의 크기 설정 (StackFit.loose : 자식들은 자신의 크기를 유지(디폴트), StackFit.expand : 가능한 Stack의 모든 공간을 차지하도록 확장. 화면 전체를 차지해야 하는 배경 같은 작업할 때 유용)
//          fit 속성은 non-positioned 자식 위젯에만 적용

// Container
// 레이아웃 구성 시 가장 널리 사용하는 위젯 중 하나이며, 다양한 기능을 가지는 기본 위젯입니다.
// 단일 자식 위젯을 가질 수 있고, 크기 조절, 여백, 색상, 테두리 등을 설정할 수 있습니다.
// child 가 없으면 최대 크기를 차지하고, child 가 있으면 child 의 크기를 차지합니다.
// 주요 속성
// 1. child : 자식 위젯
// 2. width : 너비
// 3. height : 높이
// 4. padding : 내부 여백
// 5. margin : 외부 여백
// 6. color : 배경색
// 7. decoration : 배경색, 테두리, 그림자 등

// Positioned
// Stack 위젯 내에서 자식 위젯의 위치를 정확하게 지정할 때 사용하는 위젯입니다.
// Stack 위젯과 함께 사용되어야 하며 left, right, top, bottom 속성으로 위치를 조절합니다.

class StackWidget extends StatelessWidget {

  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.green,  // 가장 아래 쪽에 배치
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.yellow,  // 가장 윗 쪽에 배치
        ),
        Positioned(
          top: 50,
          left: 200,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.orange,
          )
        )
      ],
    );
  }

}