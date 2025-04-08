import 'package:flutter/material.dart';

// GridView
// 2차원 배열 형태의 레이아웃을 제공하는 위젯입니다.
// 여러 항목을 정렬된 격자 형태로 배치할 때 사용되며, 이미지 갤러리나 쇼핑몰 아이템 목록 등을 표시할 때 유용합니다.
// 가로 또는 세로 스크롤이 가능합니다.
// 주요 생성 방식
// 1. GridView() : 일반적인 그리드 생성자. 자식 위젯을 직접 리스트로 제공
// 2. GridView.count() : 고정된 수의 타일로 레이아웃 구성
// 3. GridView.extent() : 최대 가로 축 범위를 갖는 타일로 레이아웃 구성
// 4. GridView.builder() : 많은 수의 자식이 있는 그리드를 효율적으로 구성
// 5. GridView.custom() : 커스텀 SliverGridDelegate를 사용하여 임의의 2D 자식 배열 생성
// 주요 속성
// 1. gridDelegate : 격자의 레이아웃을 결정. 주로 SliverGridDelegateWithFixedCrossAxisCount, SliverGridDelegateWithMaxCrossAxisExtent 사용
// 2. scrollDirection : 스크롤 방향을 설정. 디폴트는 수직 방향 (Axis.vertical, Axis.horizontal)
// 3. children : 그리드에 표시할 자식 위젯들의 목록
// 4. padding : 그리드 주변에 적용할 여백

class GridViewWidget extends StatelessWidget {

  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      children: [
        Card(color: Colors.cyan,),
        Card(color: Colors.purple,),
        Card(color: Colors.black12,),
        Card(color: Colors.yellow,),
        Card(color: Colors.cyan,),
        Card(color: Colors.purple,),
        Card(color: Colors.black12,),
        Card(color: Colors.yellow,),
      ],
    );
  }

}