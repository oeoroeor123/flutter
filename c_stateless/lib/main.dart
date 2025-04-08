import 'package:c_stateless/01_TextWidget.dart';
import 'package:c_stateless/02_IconWidget.dart';
import 'package:c_stateless/03_ImageWidget.dart';
import 'package:c_stateless/04_PlaceholderWidget.dart';
import 'package:c_stateless/05_ListTileWidget.dart';
import 'package:c_stateless/06_TooltipWidget.dart';
import 'package:c_stateless/07_SnackBarWidget.dart';
import 'package:c_stateless/08_ButtonWidget.dart';
import 'package:c_stateless/09_DialogWidget.dart';
import 'package:c_stateless/10_ToastWidget.dart';
import 'package:flutter/material.dart';

// StatelessWidget
// 상태가 변하지 않는 UI를 만들 때 사용하는 기본 위젯입니다.
// 생성 이후에 내부 상태를 변경하지 않고 고정된 데이터나 UI를 표시합니다.

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("statelessWidget"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child:
          // const TextWidget(),
          // const IconWidget(),
          // const ImageWidget(),
          // const PlaceholderWidget(),
          /*
          ListTileWidget(
            title: "제목",
            subtitle: "부제목",
            onTap: () {
              print("항목이 선택되었습니다.");
            },
          ),
          */
          // const TooltipWidget(),
          // const SnackBarWidget(),
          // const ButtonWidget(),
          // const DialogWidget(),
          const ToastWidget(),
        ),
      )
    );
  }
}
