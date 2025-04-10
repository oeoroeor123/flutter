import 'package:flutter/material.dart';
import 'package:l_with_springboot/view/ProductListPage.dart';
import 'package:l_with_springboot/view/ProductModifyPage.dart';
import 'package:l_with_springboot/view/ProductRegistPage.dart';
import 'package:l_with_springboot/viewmodel/ProductProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // 상태 변화 잡기 위해 사용
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ProductListPage(),
      
      // 페이지 이동을 위한 Route 처리
      // 처리 방법
      // 1. 이동할 위젯을 만든다.
      // 2. main.dart에서 route로 이동을 처리한다.
      initialRoute: "/",
      routes: {

        // 등록 페이지로 이동
        "/regist": (context) => ProductRegistPage(), // "/regist" 요청이 오면 ProductRegistPage 위젯을 연다.
        // 리스트 페이지로 이동
        "/list": (context) => ProductListPage(),
        // 수정 페이지로 이동
        "/modify": (context) => ProductModifyPage(),
      },
    );
  }


}