import 'package:flutter/material.dart';

// BottomNavigationBar
//
// 개념
// 화면 하단에 위치하는 네비게이션 바를 제공하는 위젯입니다.
// 탭 형태의 네비게이션을 구현하며 이를 통해 여러 섹션 간의 이동을 쉽게 구현할 수 있습니다.
//
// 주요 특징
// 1. Scaffold 위젯의 bottomNavigationBar 속성을 이용해야 합니다.
// 2. 각 탭은 아이콘과 레이블로 구성되며, 최대 5개까지 권장합니다.
// 3. 탭을 선택 했을 때 특정 동작을 수행하거나 화면을 업데이트 할 수 있습니다.

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});
  @override
  State<StatefulWidget> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarPage> {

  // 상태 변수
  int _currentIndex = 0;

  // 페이지 (일반적으로 최대 5개까지 사용)
  static const List<Widget> _pages = [
    Center(child: Text("페이지1"),),
    Center(child: Text("페이지2"),),
    Center(child: Text("페이지3"),),
  ];

  // 하단 네비게이션 바를 탭하면 동작하는 함수
  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomNavigationBar"),
      ),
      body: _pages[_currentIndex],
      // 하단 네비게이션 바
      bottomNavigationBar: BottomNavigationBar(
        // 인덱스 등록 (선택된 현재 탭의 인덱스)
        currentIndex: _currentIndex,
        // 탭 메뉴 선택 시 동작하는 콜백 함수
        // 콜백의 매개변수를 메소드에 전달하는 패턴은 아래와 같이 처리해도 됩니다.
        // onTap: _onTapped,
        onTap: (int index) {
          _onTapped(index);
        },
        // 선택된 탭의 색상
        selectedItemColor: Colors.orange,
        // 탭 메뉴 (아이콘, 텍스트 활용)
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "검색",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "정보",
          ),
        ],
      ),
    );
  }

}