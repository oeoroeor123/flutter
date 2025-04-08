import 'package:b_layout/01_layout/01_ColumnWidget.dart';
import 'package:b_layout/01_layout/02_MediaQueryWidget.dart';
import 'package:b_layout/01_layout/03_SizedBox.dart';
import 'package:b_layout/01_layout/04_RowWidget.dart';
import 'package:b_layout/01_layout/05_StackWidget.dart';
import 'package:b_layout/01_layout/06_WrapWidget.dart';
import 'package:b_layout/01_layout/07_PaddingWidget.dart';
import 'package:b_layout/01_layout/08_AlignWidget.dart';
import 'package:flutter/material.dart';

// ListView
// 스크롤이 가능한 목록을 표시하는데 사용하는 위젯입니다.
// 화면의 크기를 초과하는 항목들을 효율적으로 관리할 수 있습니다. (다양한 위젯을 자식으로 포함하는 개념)
// 주요 유형
// 1. ListView() : 적은 수의 항목에 적합
// 2. ListView.builder() : 많은 수의 항목에 적합 (효율적인 메모리 관리 기능 때문)
// 3. ListView.separated() : 항목 사이에 구분자 추가 기능
// 주요 속성
// 1. children : 자식으로 포함할 위젯 목록(항목)
// 2. itemCount : 자식으로 포함할 위젯 개수 (ListView.builder(), ListView.separated() 사용 시 가능)
// 3. itemBuilder : 각 자식을 생성하는 함수 (ListView.builder(), ListView.separated() 사용 시 가능)

class ListViewWidget extends StatelessWidget {

  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final List<StatelessWidget> widgets = [
      const Text("ListView Widget", textAlign: TextAlign.center,),
      const ColumnWidget(),
      // const MediaQueryWidget(),
      const SizedBoxWidget(),
      const RowWidget(),
      const StackWidget(),
      const WrapWidget(),
      const PaddingWidget(size: 10),
      const AlignWidget(),
    ];

    return ListView.separated(
      // ListView에 항목 추가하는 함수
      itemBuilder: (BuildContext context, int index) {
        return widgets[index];
      },
      // ListView의 항목 사이 구분선을 추가하는 함수
      separatorBuilder: (BuildContext context, int index) => Divider(),
      // ListView의 항목 개수
      itemCount: widgets.length,
    );

  }

}