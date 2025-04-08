import 'package:e_navigator/common/ScaffoldWidget.dart';
import 'package:flutter/material.dart';

class QueryStringPage extends StatelessWidget {

  final int page;
  final String sort;

  const QueryStringPage({ required this.page, required this.sort, super.key });

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Parameter page = $page, Parameter sort = $sort"),
            SizedBox(height: 20),
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