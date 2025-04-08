import 'package:f_provider/View/CounterViewConsumer.dart';
import 'package:f_provider/View/CounterViewProvider.dart';
import 'package:f_provider/ViewModel/CounterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// MVVM Pattern
// 1. Model
// 데이터 정의, 데이터 변경 메소드 제공, 데이터 소스 관련 로직(데이터베이스, API 호출 등)
// 2. View
// UI 구성, Provider를 이용해 ViewModel에 접근(View가 직접 Modle에 접근하지 않도록 주의)
// 3. ViewModel
// Model 인스턴스 포함, ChageNotifier와 함께 notifyListeners() 메소드 호출


// ChangeNotifierProvider
// viewModel을 앱 전체에 제공하는 역할을 수행한다.(viewModel과 view의 연결)
void main() {
  runApp(
    ChangeNotifierProvider(
        // create: (_) => CounterViewModel(), // 매개변수가 필요하지만, 매개변수 사용을 하지 않을때 _로 지정
        create: (BuildContext context) => CounterViewModel(), // viewModel 등록
        child: const MyApp(),
    )
  );
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
      home:
      // ui 담당하는 view를 호출한다.
      // const CounterViewProvider(),
         const CounterViewConsumer(),
    );
  }

}
