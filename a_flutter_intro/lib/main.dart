import 'package:flutter/material.dart';

// 플러터 애플리케이션의 진입 함수
void main() {
  // runApp() : 주어진 위젯을 "위젯 트리"의 루트로 구성합니다.
  runApp(const MyApp());  // 불변 객체(위젯 인스턴스)
}

// MyApp 위젯
// StatelessWidget 또는 StatefulWidget 중 하나를 상속 받아야 합니다.
class MyApp extends StatelessWidget {

  // 생성자 호출
  // super.key를 사용하여 부모 클래스인 StatelessWidget의 생성자를 호출합니다.
  // super.key는 현재 위젯의 키(key)를 설정할 때 사용됩니다.
  // Flutter는 위젯 트리에 존재하는 각 위젯을 고유하게 식별하기 위해서 키(key)를 사용합니다.
  // 이를 이용해 Flutter는 위젯 트리를 효율적으로 업데이트 하고, 상태를 관리할 수 있습니다.
  const MyApp({super.key});

  // build()
  // 위젯이 실행되면 자동으로 build() 메소드가 호출되고 build() 메소드가 반환한 위젯을 화면에 표시합니다.
  // 화면에 표시할 UI를 정의해서 이를 반환합니다.

  // BuildContext context
  // BuildContext는 특정 위젯의 위치를 나타내고, 해당 위젯이 속한 트리 구조를 이해하는데 필요한 정보를 포함하고 있습니다.
  // 1. 위치 정보 : context는 위젯이 현재 위치한 트리 구조에서의 정보를 제공합니다.
  //               이 정보는 위젯이 어떤 부모 위젯과 연결되어 있는지, 해당 위젯이 어떤 상태를 갖고 있는지를 알 수 있게 합니다.
  // 2. 상태 접근 : 플러터에서는 위젯이 자신의 부모 위젯이나 조상 위젯의 상태에 접근할 필요가 있을 때 context를 사용합니다.
  // 3. 테마 및 스타일 위젯 : 위젯의 스타일이나 테마를 결정할 때도 context가 필요합니다.
  // 4. 위젯 트리 탐색 : context를 통해 위젯 트리를 탐색하고, 특정 위젯의 부모나 자식 위젯에 접근할 수 있습니다. 이는 복잡한 UI를 구성할 때 유용힙니다.
  @override
  Widget build(BuildContext context) {

    // Material Design
    // Google이 개발한 UI 디자인 가이드를 기반으로 한 디자인 시스템입니다.
    // 주요 특징
    // 1. 일관성
    //   Material Design은 타이포그래피와 색상을 중요하게 다루어 앱 전반에 걸쳐 일관된 디자인을 제공합니다.
    // 2. 물리적 속성
    //   그림자, 모서리 라운딩 등을 활용하여 깊이와 흐름을 표현합니다. 이는 빛과 그림자를 반사하는 방식을 포함하여 입체감을 살립니다.
    // 3. 동적 요소
    //   애니메이션과 전환 효과를 사용하여 움직임을 나타내며, 사용자 상호작용을 직관적이고 명확하게 표현합니다.
    // 4. 컨텐츠 중심
    //   현대적인 출판물 디자인 원칙을 반영하여 부가요소보다 컨텐츠 자체를 강조합니다.

    // MaterialApp
    // Material Design에 최적화 되어 있는 루트 위젯입니다.
    // 애플리케이션의 전반적인 사항(테마, 스타일, 네비게이션 및 라우트)을 관리하는 위젯입니다.
    // 주요 속성
    // 1. title : 애플리케이션 제목
    // 2. theme : 애플리케이션 기본 테마
    // 3. home  : 애플리케이션 기본 화면 설정 (일반적으로 첫 화면을 표시하는 위젯을 등록합니다.)
    // 4. routes: 위젯과 위젯을 매핑하는 라우트를 정의하며, key/value 조합으로 구성합니다.

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // MyHomePage 위젯이 반환하는 값을 첫 화면으로 표시합니다.
      home: const MyHomePage(title: 'Flutter Demo Home Page'),  // MyHomePage 생성자 호출
    );
  }
}

// 간단한 구성을 위해서 StatefullWidget 상속을 StatelessWidget 상속으로 변경합니다.
class MyHomePage extends StatelessWidget {

  // MyHomePage 생성자 호출 시 title 파라미터를 반드시 받아옵니다.
  // 전달 받은 title 파라미터는 필드 title 에 저장합니다.
  const MyHomePage({super.key, required this.title});

  // 전달 받은 title 파라미터 값을 저장하고, 그 값은 바꿀 수 없습니다.
  final String title;

  @override
  Widget build(BuildContext context) {

    // Scaffold
    // 애플리케이션의 기본 레이아웃을 구성할 때 사용하는 핵심 위젯입니다.
    // Material Design을 기반으로 앱의 구조를 정의하고 다양한 UI 요소를 포함할 수 있도록 지원합니다.
    // 애플리케이션의 뼈대를 만드는 위젯으로, 상단 바(appBar), 본문(body), 하단 네비게이션 바(bottomNavigationBar) 등의 요소로 구성됩니다.
    // 주요 속성
    // 1. appBar : 상단에 표시되는 앱바(AppBar)
    // 2. body   : 앱의 주요 컨텐츠를 표시하는 영역
    // 3. floatingActionButton : 화면에 떠 있는 액션 버튼
    // 4. drawer : 좌측에서 열리는 네이게이션 드로어
    // 5. bottomNavigationBar : 하단에 표시되는 네비게이션 바
    // 6. backgroundColor : 배경색
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),  // Text(this.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('첫 번째 Text'),
            const Text('두 번째 Text', style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }

}
