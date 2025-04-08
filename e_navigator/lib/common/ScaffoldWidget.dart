import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {

  late Widget widget;

  ScaffoldWidget({ required this.widget, super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator"),
        backgroundColor: Colors.black12,
      ),
      body: widget,
    );
  }

}