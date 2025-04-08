import 'package:j_hive_provider/Model/HiveModel.dart';

class HiveViewModel {

  // viewModel에서 사용할 model 선언
  final HiveModel _hiveModel = HiveModel();

  // 초기화 (.hiveOpenBox())
  // viewModel에서는 initialize이라는 이름으로 사용
  Future<void> initialize() async {
    await _hiveModel.hiveOpenBox();
  }

  // Model에서 처리한 메소드를 활용
  // 단일 데이터 저장
  Future<void> registData(String key, dynamic value) async {
    await _hiveModel.saveSingleData(key, value);
  }

  // 다중 데이터 저장
  Future<void> registBulkData(Map<String, dynamic> data) async {
    await _hiveModel.saveBulkData(data);
  }

  // 단일 데이터 조회
  dynamic getData(String key) {
    return _hiveModel.getSingleData(key);
  }

  // 다중 데이터 조회
  Map<dynamic, dynamic> getAllData() {
    return _hiveModel.getBulkData();
  }

  // 데이터 삭제
  Future<void> deleteData(String key) async {
    await _hiveModel.deleteData(key);
  }


}

