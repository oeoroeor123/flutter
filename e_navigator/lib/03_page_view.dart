import 'package:e_navigator/common/ScaffoldWidget.dart';
import 'package:flutter/material.dart';

// PageView
// 여러 페이지를 스와이프하며 이동할 수 있도록 지원하는 위젯입니다.
// 각 페이지는 뷰포트(viewport) 크기에 맞춰 표시됩니다.

class PageViewWidget extends StatelessWidget {

  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {

    // PageController 생성
    final PageController _controller = PageController(initialPage: 0);

    // UI 빌드
    return ScaffoldWidget(
      widget: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,  // 화면 전환 방식 : Axis.horizontal(좌우. 디폴트), Axis.vertical (상하)
        children: [
          Container(
            color: Colors.red,
            child: Center(child: const Text("페이지 1", style: TextStyle(fontSize: 36),)),
          ),
          Container(
            color: Colors.green,
            child: Center(child: const Text("페이지 2", style: TextStyle(fontSize: 36),)),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: const Text("페이지 3", style: TextStyle(fontSize: 36),)),
          ),
        ],
      )
    );

  }

}