import 'package:e_navigator/common/ScaffoldWidget.dart';
import 'package:flutter/material.dart';

class PathVariablePage extends StatelessWidget {

  final int id;

  const PathVariablePage({ required this.id, super.key });

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Path Variable : $id"),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("뒤로 가기"),
            ),
          ],
        ),
      )
    );
  }

}