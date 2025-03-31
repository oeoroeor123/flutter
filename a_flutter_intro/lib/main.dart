import 'package:flutter/material.dart';

// 플러터 애플리케이션의 진입 함수
void main() {
  // runApp() : 주어진 위젯을 '위젯 트리'에 루트로 구성한다. (최상위 위젯으로 만든다.)
  runApp(const MyApp()); // 불변 객체(위젯 인스턴스)
}

// myApp 위젯
// StatelessWidget 또는 StatefulWidget 중 하나를 상속 받아야 한다.
class MyApp extends StatelessWidget {
  // 생성자 호출
  // super.key를 사용하여 부모 클래스인 StatelessWidget의 생성자를 호출한다.
  // super.key는 현재 위젯의 키(key)를 설정할 때 사용된다.
  // Flutter는 위젯 트리에 존재하는 각 위젯을 고유하게 식별하기 위해 키(key)를 사용한다.
  // 이를 이용해 Flutter는 위젯 트리를 효율적으로 업데이트하고, 상태를 관리할 수 있다.
  const MyApp({super.key});

  // build()
  // 위젯이 실행되면 자동으로 build() 메소드가 호출되고, build() 메소드가 반환한 위젯을 화면에 표시한다.
  // 화면에 표시할 UI를 정의해서 이를 반환한다. (반환 타입 Widget)
  @override
  Widget build(BuildContext context) {

    // Material Design
    // Google이 개발한 UI 디자인 가이드를 기반으로 한 디자인 시스템이다.

    // MaterialApp
    // Material Design에 최적화되어 있는 루트 위젯이다.
    // 애플리케이션의 전반적인 사항(테마, 스타일, 네비게이션 및 라우트)을 관리하는 위젯이다.
    // 주요 속성
    // 1. title : 애플리케이션 제목
    // 2. theme : 애플리케이션 기본 테마
    // 3. home : 애플리케이션 기본 화면 설정 (일반적으로 첫 화면을 표시하는 위젯을 등록)
    // 4. routes : 위젯과 위젯을 매핑하는 라우트를 정의하며, key / value 조합으로 구성
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // MyHomePage 위젯이 반환하는 값을 첫 화면으로 표시한다.
      home: const MyHomePage(title: 'Flutter Demo Home Page'), // MyHomePage 생성자 호출
    );
  }
}

// 간단한 구성을 위해서 StatefullWidget 상속을 StatelessWidget 상속으로 변경
class MyHomePage extends StatelessWidget {

  // MyHomePage 생성자 호출 시 title 파라미터를 반드시 받아 온다.
  // 전달 받은 title 파라미터는 필드 title에 저장한다.
  const MyHomePage({super.key, required this.title}); // named parameter( {} ) 사용

  // 전달 받은 title 파라미터 값을 저장하고, 그 값은 바꿀 수 없다.
  final String title; // final : 초기 값 제외하고 title 지정

  @override
  Widget build(BuildContext context) {

    // Scaffold
    // 애플리케이션의 기본 레이아웃을 구성할 때 사용하는 핵심 위젯
    // Material Design을 기반으로 앱의 구조를 정의하고 다양한 UI 요소를 포함할 수 있도록 지원한다.
    // 애플리케이션의 뼈대를 만드는 위젯으로, 상단 바(appBar), 본문(body), 하단 네비게이션 바(bottomNavigationBar) 등의 요소로 구성된다.
    // 주요 속성
    // 1. appBar: 상단에 표시되는 앱 바(appBar)
    // 2. body: 앱의 주요 콘텐츠를 표시하는 영역
    // 3. floatingActionButton: 화면에 떠 있는 액션 버튼
    // 4. drawer: 좌측에서 열리는 네비게이션 드로어
    // 5. bottomNavigationBar: 하단에 표시되는 네비게이션 바
    // 6. backgroundColor: 배경 색
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title), // this.title과 동일
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('첫 번째 텍스트'),
            const Text('두 번째 텍스트', style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }

}
