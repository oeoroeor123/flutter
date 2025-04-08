import 'package:flutter/material.dart';

// Placeholder
// 어떤 UI 구성 요소의 자리를 표시할 때 사용하는 위젯입니다.
// 아직 구현되지 않은 요소의 자리를 나타낼 때 유용하게 사용할 수 있습니다.
// 실제 배포 전에는 반드시 실제 위젯으로 교체해야 합니다.
// 주요 속성
// 1. color : 자리 표시자의 색상
// 2. strokeWidth : 자리 표시자의 테두리 두께 (디폴트 2.0)
// 3. fallbackWidth : 제약 없을 때 자리 표시자의 너비 (디폴트 null : 부모 위젯의 크기에 따라서 자동으로 조정)
// 4. fallbackHeight : 제약 없을 때 자리 표시자의 높이 (디폴트 null : 부모 위젯의 크기에 따라서 자동으로 조정)

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {

    /*
    return Placeholder(
      fallbackWidth: 50,
      fallbackHeight: 50,
      color: Colors.black12
    );
     */

    /* sizedBox로 묶어서 크기 조정해줘야 함
    return SizedBox(
      width: 100,
      height: 100,
      child: Placeholder(
        fallbackWidth: 50,
        fallbackHeight: 50,
        color: Colors.deepOrange,
      ),
    );
     */

    // 레이아웃 구조 잡기
    return Column(
      children: [
        Placeholder(fallbackHeight: 100,),
        Expanded(child: Placeholder()),
        Placeholder(fallbackHeight: 100,),
      ],
    );
  }
}