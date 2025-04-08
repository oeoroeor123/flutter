import 'package:flutter/material.dart';

// Align
// 자식 위젯을 정렬할 때 사용하는 레이아웃 위젯입니다.
// 부모 위젯 내에서 자식 위젯의 위치를 정밀하게 제어할 수 있습니다.
// 복잡한 레이아웃이나 반응형 디자인을 구현할 때 주로 사용됩니다.

/* 본 예시는 AlignWidget 구성을 위해서 ContainerWidget 을 사용하고 있습니다. */

class AlignWidget extends StatelessWidget {

  const AlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ContainerWidget(color: 'red'),
        ),
        Align(
          alignment: Alignment.center,
          child: ContainerWidget(color: ''),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ContainerWidget(color: 'blue'),
        ),
        Align(
          alignment: Alignment.center,
          child: ContainerWidget(),
        ),
      ],
    );
  }

}

class ContainerWidget extends StatelessWidget {

  final String? color;  // nullable color

  const ContainerWidget({ this.color, super.key });

  @override
  Widget build(BuildContext context) {

    final Color? containerColor;

    if (color == null) {
      containerColor = Colors.teal;
    } else {
      switch (color!.toLowerCase()) {
        case 'red':
          containerColor = Colors.red;
          break;
        case 'green':
          containerColor = Colors.green;
          break;
        case 'blue':
          containerColor = Colors.blue;
          break;
        default:
          containerColor = Colors.grey;
      }
    }

    return Container(
      color: containerColor,
      width: 100,
      height: 100,
      child: const Center(
        child: Text("위젯"),
      ),
    );

  }

}