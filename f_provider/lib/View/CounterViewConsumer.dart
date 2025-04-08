// Consumer
// Consumer는 ViewModel의 상태를 감시한다.
// 상태가 변경될 때 마다 Consumer의 builder() 함수가 호출되고, 이 builder() 함수 부분만 리빌드 된다.
// 전체 위젯 트리가 리빌드 되는 방식이 아니므로 성능이 향상될 수 있다.

import 'package:f_provider/ViewModel/CounterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterViewConsumer extends StatelessWidget {

  const CounterViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {

    /*
    return Scaffold(
      appBar: AppBar(
          title: const Text("MVVM Pattern Counter")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Consumer 사용으로 count 값이 변경되면 builder()가 반환하는 부분이 리빌드된다.
            Consumer<CounterViewModel>(
              builder: (BuildContext context, CounterViewModel provider, Widget? child) {
                // 리빌드 되는 부분 (count값 변경)
                return Text("현재 count = ${provider.count}", style: TextStyle(fontSize: 32),);
              },
            ),
            SizedBox(height: 20),
              Consumer<CounterViewModel>(
                builder: (BuildContext context, CounterViewModel provider, Widget? child) {
                  return
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // BuildContext를 이용해 ViewModel (provider)에 접근하기
                      ElevatedButton(onPressed: () {
                        // .read : context를 이용해 위젯 트리에 접근해 counterViewModel을 읽어 온다.
                        CounterViewModel provider = context.read<CounterViewModel>();
                        provider.increment();
                      }, child: const Text("+")),
                      ElevatedButton(onPressed: () {
                        context.read<CounterViewModel>().decrement();
                      }, child: const Text("-")),
                      ElevatedButton(onPressed: () {
                        context.read<CounterViewModel>().reset();
                      }, child: const Text("reset"))
                    ],
                  );
                }
             ),
          ],
        ),
      ),
    );
    */

    // builder()의 child 활용하기
    return Scaffold(
      appBar: AppBar(
          title: const Text("MVVM Pattern Counter")
      ),
      body: Center(
        child: Consumer(
            builder: (BuildContext context, CounterViewModel provider, Widget? child) {
              return
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Consumer 사용으로 count 값이 변경되면 builder()가 반환하는 부분이 리빌드된다.
                    Text("현재 count = ${provider.count}", style: TextStyle(fontSize: 32),),
                    SizedBox(height: 20),
                    child ?? Text(""), // child!
                  ],
                );
            },
          child: const _ButtonWidget(), // builder() 함수의 3번 매개변수 Widget? child로 전달
        ),
      ),
    );
  }
}


class _ButtonWidget extends StatelessWidget {

  const _ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // BuilderContext를 이용한 ViewModel 접근
        ElevatedButton(onPressed: () {
          context.read<CounterViewModel>().increment();
        }, child: const Text("+")),
        ElevatedButton(onPressed: () {
          context.read<CounterViewModel>().decrement();
        }, child: const Text("-")),
        ElevatedButton(onPressed: () {
          context.read<CounterViewModel>().reset();
        }, child: const Text("reset"))
      ],
    );
  }
}