import 'package:flutter/material.dart';
import 'package:j_hive_provider/ViewModel/HiveViewModel.dart';

class ButtonWidget extends StatelessWidget {

  // 필드 잡기
  final HiveViewModel viewModel;

  ButtonWidget({ required this.viewModel, super.key });


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await viewModel.registData("spring", "봄");
            },
            child: const Text("단일 데이터 저장"),
          ),
          ElevatedButton(
            onPressed: () async {
              Map<String, dynamic> data = {
                "summer" : "여름",
                "autumn" : "가을",
                "winter" : "겨울",
              };
              await viewModel.registBulkData(data);
            },
            child: const Text("다중 데이터 저장"),
          ),
          // 조회는 비동기 처리하지 않음
          ElevatedButton(
            onPressed: () {
              final dynamic value = viewModel.getData("spring");
              print("단일 데이터 조회 결과 : $value");
            },
            child: const Text("단일 데이터 조회"),
          ),
          ElevatedButton(
            onPressed: () {
              final Map<dynamic, dynamic> data = viewModel.getAllData();
              print("다중 데이터 조회 결과 : $data");
            },
            child: const Text("다중 데이터 조회"),
          ),
          ElevatedButton(
            onPressed: () async {
              await viewModel.deleteData("winter");
              final Map<dynamic, dynamic> data = viewModel.getAllData();
              print("삭제 후 데이터 조회 결과 : $data"); // winter 삭제 후 나머지 데이터 조회 결과
            },
            child: const Text("데이터 삭제"),
          ),
        ],
      ),
    );
  }
}