import 'package:flutter/material.dart';

// TabBar
//
// 개념
// 여러 화면이나 콘텐츠 섹션을 쉽게 탐색할 수 있게 해 주는 위젯입니다.
// TabBar를 사용하면 앱의 사용자 경험을 향상시키고, 복잡한 정보를 체계적으로 구성할 수 있습니다.
//
// 주요 특성
// 1. 구성
//   TabBar 는 일반적으로 AppBar 의 bottom 속성이나 화면의 다른 부분에 배치합니다.
// 2. 컨트롤러
//   TabBar 는 TabController 를 사용하여 동작을 제어합니다. DefaultTabController 를 사용하여 더 간단하게 구현할 수도 있습니다.
// 3. 탭 구성
//   tabs 속성을 통해서 여러 개의 Tab 위젯을 추가할 수 있습니다. 각 Tab 은 아이콘, 레이블 또는 둘 다를 포함할 수 있습니다.
// 4. 스타일링
//   TabBar 는 다양한 스타일 옵션을 제공합니다. labelColor, unselectedLabelColor, indicatorColor 등을 이용해 선택된 탭과 그렇지 않은 탭의 외관을 스타일링 할 수 있습니다.
// 5. TabBarView
//   TabBar 와 함께 사용되는 TabBarView  각 탭에 해당하는 컨텐츠를 표시합니다. TabBarView 의 children 속성에 각 탭에 대응하는 위젯을 추가합니다.
//
// 주요 속성
// 1. tabs : 탭의 목록을 정의. 일반적으로 Tab 위젯을 이용해 각 탭을 설정
// 2. controller : TabController 를 사용하여 탭의 선택 상태와 애니메이션 관리
// 3. indicator : 현재 선택된 탭을 나타내는 인디케이터 스타일 설정

class TabBarViewPage extends StatelessWidget {

  const TabBarViewPage({super.key});

  @override
  Widget build(BuildContext context) {

    // 간단한 사용을 제공하는 DefaultTabController
    return DefaultTabController(
      length: 3,  // TabBarView 에 포함되는 children 의 개수와 동일하게 설정
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBarView"),
          backgroundColor: Colors.black12,
          bottom: const TabBar(
            indicatorColor: Colors.red,
            tabs: [
              Tab(icon: Icon(Icons.directions_bike), child: Text("자전거"),),
              Tab(icon: Icon(Icons.directions_bus), child: Text("버스"),),
              Tab(icon: Icon(Icons.directions_railway), child: Text("지하철"),),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            //------------------------ 1번째 탭 화면 ------------------------//
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("arguments 를 이용한 데이터 전달"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/arguments",
                        arguments: {  // 숫자, 문자열, Map 등 다양한 형태로 전송 가능
                          "name": "tom",
                          "age": 30
                        }
                        /*
                          ------------------------------------------------------------------
                          | main.dart 에서 routes 작업을 안해도 페이지 이동할 수 있습니다. |
                          ------------------------------------------------------------------
                          // MaterialPageRoute
                          // 페이지 간 전환을 위한 라우트를 제공하는 위젯입니다.
                          // 주로 Navigator.push() 메소드와 함께 사용되면서 새로운 화면으로 이동할 때 사용합니다.
                          // 주요 속성
                          // builder : 이동할 새로운 페이지의 위젯을 반환
                          // settings : 페이지 전환 시 추가적인 정보를 전달하거나 라우트를 식별하는 용도로 사용
                          ------------------------------------------------------------------
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const ArgumentsPage(),  //----- 여기서 바로 이동
                              settings: const RouteSettings(
                                arguments: {"name": "tom", "age": 30}
                              )
                            )
                          );
                        */
                      );
                    },
                    child: const Text("ArgumentsPage"),
                  )
                ],
              ),
            ),

            //------------------------ 2번째 탭 화면 ------------------------//
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("path variable 을 이용한 데이터 전달"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/path/10");
                    },
                    child: const Text("PathVariablePage"),
                  ),
                ],
              ),
            ),

            //------------------------ 3번째 탭 화면 ------------------------//
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Query String 을 이용한 Parameter 전달"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/query?page=5&sort=name,desc");
                      Navigator.pushNamed(context, "/query");  // 디폴트 Parameter 확인용
                    },
                    child: const Text("QueryStringPage"),
                  ),
                ],
              ),
            ),

          ]
        ),
      ),
    );

  }

}