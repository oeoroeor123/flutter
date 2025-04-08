import 'package:e_navigator/01_navigator.dart';
import 'package:e_navigator/02_arguments.dart';
import 'package:e_navigator/02_path_variable.dart';
import 'package:e_navigator/02_query_string.dart';
import 'package:e_navigator/02_tab_bar_view.dart';
import 'package:e_navigator/03_page_view.dart';
import 'package:e_navigator/04_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // 초기 라우트
      // initialRoute: "/main",  01_navigator.dart
      // initialRoute: "/tab",  02_tab_var_view.dart
      // initialRoute: "/pageView",
      initialRoute: "/bottom",

      // 네비게이션 이벤트 추적을 위한 커스텀 NavigatorObserverView 등록
      navigatorObservers: [
        NavigatorObserverView(),
      ],

      // 라우트 별 위젯 등록
      routes: {
        // 01_navigator.dart
        "/main": (BuildContext context) => const MainPage(),
        "/about": (BuildContext context) => const AboutPage(),
        // 02_tab_bar_view.dart
        "/tab": (BuildContext context) => const TabBarViewPage(),
        "/arguments": (BuildContext context) => const ArgumentsPage(),
        // 03_page_view.dart
        "/pageView": (BuildContext context) => const PageViewWidget(),
        // 04_bottom_navigation_bar.dart
        "/bottom": (BuildContext context) => const BottomNavigationBarPage(),
      },

      // PathVariable 또는 Query String 을 이용한 Parameter 전달 시 실행
      onGenerateRoute: (RouteSettings settings) {

        // routeName
        final String routeName = settings.name!;

        // PathVariable 처리
        if(routeName.startsWith("/path")) {
          // "/path/10" 에서 10 추출하기
          final String id = routeName.split("/").last;
          // PathVariablePage 로 id 를 전달하며 이동
          return MaterialPageRoute(
            // MaterialPageRoute
            // 페이지 간 전환을 위한 라우트를 제공하는 위젯입니다.
            // 주로 Navigator.push() 메소드와 함께 사용되면서 새로운 화면으로 이동할 때 사용합니다.
            // 주요 속성
            // builder : 이동할 새로운 페이지의 위젯을 반환
            // settings : 페이지 전환 시 추가적인 정보를 전달하거나 라우트를 식별하는 용도로 사용
            builder: (BuildContext context) {
              return PathVariablePage(id: int.parse(id));
            }
          );
        }

        // routeName 분석을 위한 Uri 객체 생성
        Uri uri = Uri.parse(routeName);

        // Query String 처리
        if(routeName.startsWith("/query")) {

          // Parameter 추출하기
          final String? strPage = uri.queryParameters["page"];
          final String? strSort = uri.queryParameters["sort"];

          // Parameter 타입 변환 및 디폴트 처리
          final int page = strPage == null ? 1 : int.parse(strPage);
          final String sort = strSort ?? "id,asc";

          // QueryStringPage 로 page 와 sort 전달하며 이동
          return MaterialPageRoute(
            builder: (context) => QueryStringPage(page: page, sort: sort)
          );

        }

      },

    );
  }

}

// NavigatorObserver
//
// 개념
// 네비게이션 시스템에서 라우트의 상태 변경을 모니터링하고 추적할 때 사용하는 클래스입니다.
// NavigatorObserver 클래스를 이용해 라우트가 추가되거나 제거되는 등의 이벤트를 감지할 수 있고,
// 이를 통해 네비게이션의 흐름을 제어하거나 로그를 기록하는 등의 작업을 수행할 수 있습니다.
//
// 주요 메소드
// 1. didPush()    : 새로운 라우트가 스택에 추가될 때 호출
// 2. didPop()     : 사용자 액션(뒤로 가기 버튼 클릭하기)에 의해 현재 라우트가 스택에서 제거될 때 호출(예 : Navigator.pop()을 통한 뒤로 가기)
// 3. didRemove()  : 프로그래밍 방식으로 라우트를 강제로 제거할 때 호출(예 : Navigator.removeRoute()을 통한 라우트 강제 제거)
// 4. didReplace() : 어떤 라우트가 다른 라우트로 교체될 때 호출

class NavigatorObserverView extends NavigatorObserver {

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    print("페이지 추가 완료");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print("페이지 제거 완료");
  }

}