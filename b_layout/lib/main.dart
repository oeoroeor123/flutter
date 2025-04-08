import 'package:b_layout/01_layout/00_ListViewWidget.dart';
import 'package:b_layout/01_layout/03_SizedBox.dart';
import 'package:b_layout/02_grid/01_GridViewWidget.dart';
import 'package:b_layout/02_grid/02_GridViewBuilderWidget.dart';
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
      home: const MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout Component"),
        leading: const Icon(Icons.backup),
      ),
      body:

        // 01_layout 디렉터리 예시
        const ListViewWidget(),

        // 02_grid 디렉터리 예시
        // const GridViewWidget(),
        // const GridViewBuilderWidget(),

    );
  }

}