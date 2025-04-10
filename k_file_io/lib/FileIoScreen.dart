import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileIOScreen extends StatefulWidget {

  const FileIOScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FileIOState();
}

class _FileIOState extends State<FileIOScreen> {

  // 상태 (파일 내용)
  String _content = "파일에 기록되는 내용";

  // 입력 상자 컨트롤러
  final _controller = TextEditingController();

  // 파일 경로 반환 메소드
  Future<String> _getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    // 반환할 파일 경로 잡기
    return "${dir.path}/my_file.txt";
  }

  // 파일 저장 메소드
  Future<void> saveFile() async {
    // 파일 경로(path) 잡기
    String filePath = await _getFilePath();
    final File file = File(filePath);
    await file.writeAsString(_controller.text); // 사용자가 입력하는 내용이 여기에 들어옵니다.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text("파일 저장 완료"))
    );
  }

  // 파일 읽기 메소드
  Future<void> readFile() async {
    try {
      final file = File(await _getFilePath());
      final content = await file.readAsString();
      setState(() {
        // 상태 변경을 위해 바로 _content을 쓰지 않고 한번 더 처리
        _content = content;
      });
    } catch (e) {
      setState(() {
        _content = '파일이 존재하지 않습니다.';
      });
    }
  }

  // 파일 삭제 메소드
  Future<void> deleteFile() async {
    // 파일 경로를 이용해 파일 객체 생성
    final file = File(await _getFilePath());
    if(await file.exists()) {
      await file.delete();
      setState(() {
        _content = '파일이 삭제되었습니다.';
      });
    }
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File IO")
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller, // 입력 상자 컨트롤러 등록
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "파일 내용 입력",
              ),
              maxLines: 3, // 최대 3줄까지 입력
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await saveFile(); // 파일 저장 메소드
                    },
                    child: const Text("파일 저장"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await readFile(); // 파일 읽기 메소드
                  },
                  child: const Text("파일 열기(읽기)"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await deleteFile(); // 파일 삭제 메소드
                  },
                  child: const Text("파일 삭제"),
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(_content), // 파일 내용 표시 부분
          ],
        ),
      ),
    );
  }
}