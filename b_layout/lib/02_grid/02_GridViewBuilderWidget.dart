import 'package:flutter/material.dart';

class GridViewBuilderWidget extends StatelessWidget {

  const GridViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4
      ),
      itemBuilder: (BuildContext context, int index) {  // (context, index) { }
        return Card(
          color: Colors.yellow,
          child: Text("${index + 1}", textAlign: TextAlign.center,),
        );
      },
      itemCount: 16,
    );
  }

}