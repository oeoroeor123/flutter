import 'package:flutter/material.dart';
import 'package:h_http_provider/model/ResponseData.dart';
import 'package:h_http_provider/service/ApiService.dart';

class ApiViewModel with ChangeNotifier {

  final ApiService _apiService = ApiService();

  ResponseData? _data;

  ResponseData? get data => _data;

  Future<void> fetchAPI(String name) async {
    try {
      _data = await _apiService.callAPI(name);
    } catch (e) {
      print("ApiViewModel - 데이터 로드 실패 : $e");
      _data = null;
    }
    notifyListeners();
  }

}