// View
// UI를 담당
// ViewModel에서 제공하는 데이터를 이용해 ui를 구성한다.
// 상태 관리는 viewModel이 담당한다.

import 'package:f_provider/ViewModel/CounterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {

  // 생성자 주입
  const CounterView({super.key});


  @override
  Widget build(BuildContext context) {

  // provider 인스턴스 생성
  // viewModel이 제공하는 상태 값을 제공하는 역할 (int get count => _counterModel.count;)
  final CounterViewModel provider = Provider.of<CounterViewModel>(context);

  // 상태 count가 변하면, 전체 UI가 리빌드 된다.
  // 이러한 비효율을 개선하기 위해서 Consumer를 사용할 수 있다.
  return Scaffold(
    appBar: AppBar(
      title: const Text("MVVM Pattern Counter")
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // children의 text는 변수 처리를 위해 const를 붙이지 않는다.
          // provider를 이용한 상태 확인 (count가 변함)
          Text("현재 count = ${provider.count}", style: TextStyle(fontSize: 32),),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // provider를 이용한 상태 변경 버튼 (단순 버튼이기에 상태 변함 x)
              ElevatedButton(onPressed: provider.increment, child: const Text("+")),
              ElevatedButton(onPressed: provider.decrement, child: const Text("-")),
              ElevatedButton(onPressed: provider.reset, child: const Text("reset"))
            ],
          )
        ],
      ),
    ),
  );
  }

}