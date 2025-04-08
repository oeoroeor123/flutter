import 'package:flutter/material.dart';
import 'package:j_hive_provider/View/ButtonWidget.dart';
import 'package:j_hive_provider/ViewModel/HiveViewModel.dart';
import 'package:provider/provider.dart';

class HiveScreen extends StatefulWidget {

  const HiveScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HiveState();
}

class _HiveState extends State<HiveScreen> {

  // 상태 변수
  bool _isOpened = false;

  final HiveViewModel _viewModel = HiveViewModel();

  // 초기화
  @override
  void initState() {
    super.initState();
    // _viewModel.initialize(); // ViewModel에서 지정한 initialize 호출로 hiveOpenBox를 처리함
    _initialize(); // 비동기 처리를 위해 아래 새롭게 메소드를 만들고 호출함(동일한 작업을 수행 + 비동기 처리)
  }

  // HiveViewModel의 initialize() 메소드를 호출하는 메소드
  Future<void> _initialize() async {
    await _viewModel.initialize();

    // box가 오픈되면(.initialize()) 상태 변수 _isOpened이 true로 변경됨 (오픈되었다.)
    setState(() {
      _isOpened = true;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {

    // provider 인스턴스 생성
    // provider 이용해 HiveViewModel이 제공하는 상태 값 제공하는 역할 수행
    final HiveViewModel provider = Provider.of<HiveViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive and Provider"),
      ),
      // box 오픈 유무에 따라 화면을 다르게 설정
      // viewModel을 ButtonWidget에 전달
      // provider를 이용한 현재 상태 확인
      Text("현재 상태 = ${provider._isOpened}"),
      body: _isOpened ? ButtonWidget(viewModel: _viewModel) : Center(child: const CircularProgressIndicator()),
    );
  }


}

