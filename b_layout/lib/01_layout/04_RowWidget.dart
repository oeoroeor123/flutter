import 'package:flutter/material.dart';

// Row
// 수평 방향으로 여러 위젯을 배치할 때 사용하는 레이아웃 위젯입니다.
// 자식 위젯들을 좌에서 우로 순차적으로 배치하며 다양한 정렬 및 간격 조정이 가능합니다.
// 주요 속성
// 1. children : Row 안에 포함되는 자식 위젯 목록
// 2. mainAxisAlignment : 메인 축(수평 방향)에서 자식 위젯의 정렬 방식
// 3. crossAxisAlignment : 보조 축(수직 방향)에서 자식 위젯의 정렬 방식
// 4. mainAxisSize : 메인 축(수평 방향)의 크기 (MainAxisSize.min : 자식 위젯들의 합계만큼 공간 차지, MainAxisSize.max : 주 축의 사용 가능한 모든 공간 차지. 디폴트)
// 5. textDirection : 자식 위젯들의 배치 방향 (TextDirection.ltr : 좌에서 우로 배치. 디폴트, TextDirection.rtl : 우에서 좌로 배치)

// Expanded
// Row, Column, Flex 위젯의 자식 위젯을 확장시켜서 사용 가능한 공간을 최대한 채우는 위젯입니다.
// 주요 속성
// 1. flex : 자식 위젯이 차지할 공간의 비율(디폴트 1)
// 2. child : 자식 위젯

class RowWidget extends StatelessWidget {

  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: [
        Expanded(flex: 1, child: Text("1st Text", textAlign: TextAlign.center,)),
        Expanded(flex: 2, child: Text("2nd Text", textAlign: TextAlign.center,)),
        Expanded(flex: 3, child: Text("3rd Text", textAlign: TextAlign.center,)),
      ],
    );
  }

}