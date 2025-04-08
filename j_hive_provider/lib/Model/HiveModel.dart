import 'package:hive/hive.dart';

class HiveModel {

  // nullable box
  Box? _box;

  // 초기화
  Future<void> hiveOpenBox() async {
    _box = await Hive.openBox("myHive");
  }

  // box는 nullable 하기 때문에 _box 뒤에 ! 단언 붙여야함
  
  // 단일 데이터 저장 (key, value)
  // 비동기 처리
  Future<void> saveSingleData(String key, dynamic value) async {
    await _box!.put(key, value);
  }

  // 다중 데이터 저장 (Map으로 묶어서)
  // 비동기 처리
  Future<void> saveBulkData(Map<String, dynamic> data) async {
    await _box!.putAll(data);
  }

  // 단일 데이터 조회 (key)
  dynamic getSingleData(String key) {
    return _box!.get(key);
  }

  // 다중 데이터 조회 (Map으로 묶어서)
  Map<dynamic, dynamic> getBulkData() {
    return _box!.toMap();
  }

  // 단일 데이터 삭제(key)
  // 비동기 처리
  Future<void> deleteData(String key) async {
    await _box!.delete(key);
  }



}