import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    /*
    return Column(
      children: [

      // 일반 텍스트 버튼  
      TextButton(
        onPressed: () { print("TextButton"); },
        child: const Text("TextButton"),
      ),

      // 버튼 형태를 갖춘 버튼
      ElevatedButton(onPressed: () { print("ElevatedButton"); }, // console에 출력되는 내용
                     child: const Text("ElevatedButton"), // 버튼에 들어가는 text
        ),

      IconButton(onPressed: () { print("IconButton"); },
                 icon: Icon(Icons.add_box_outlined),
      ),
    ],
  );
  */

    // Scaffold : 플러터에서 디자인적 뼈대를 구성하는 위젯
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { print("FloatingActionButton"); },
        child: const Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop, // 버튼 위치 조절
    );
  }
}