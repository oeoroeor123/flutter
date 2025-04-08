import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:j_hive_provider/View/HiveScreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

  // 초기화
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  
  runApp(const MyApp());
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
      // 화면을 출력하는 view dart 파일 명시
      home: const HiveScreen(),
    );
  }
}