import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:i_hive/HiveScreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

  // main() 함수에서 비동기 작업 수행 시 반드시 호출해야 할 메소드
  // 플러터 애플리케이션의 바인딩 초기화
  // runApp() 호출 이전에 사용해야 함
  WidgetsFlutterBinding.ensureInitialized();

  // 애플리케이션 문서 디렉터리 경로 가져오기 (플러터 제공의 데이터 저장용으로 사용하는 안전한 장소)_비동기 처리
  final dir = await getApplicationDocumentsDirectory();

  // Hive 데이터베이스 초기화 (애플리케이션 문서 디렉터리 경로 사용)
  Hive.init(dir.path);

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
      home: const HiveScreen(),
    );
  }
}
