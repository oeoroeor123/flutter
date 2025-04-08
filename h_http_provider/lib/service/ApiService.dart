import 'dart:convert';

import 'package:h_http_provider/model/ResponseData.dart';
import 'package:http/http.dart' as http;

class ApiService {

  // 이름(영문만 가능)을 전달하면 해당 이름을 가진 인원 수와 추정 나이를 반환하는 간단한 API
  final String url = "https://api.agify.io?name=";

  Future<ResponseData?> callAPI(String name) async {

    try {
      final response = await http.get(Uri.parse("$url$name")); // GET 방식으로 API 요청
      if (response.statusCode == 200) { // 요청과 응답 성공
        // response.body : 응답 결과 (문자열 형식의 JSON 데이터)
        // json.decode(response.body) : JSON 데이터로 변환된 응답 결과 (타입 : dynamic)
        final dynamic jsonData = json.decode(response.body); // jsonData 는 Map 타입으로 처리
        return ResponseData.fromJson(jsonData);
      } else {
        // throw Exception("Failed to get result");
        return null;
      }
    } catch(e) {
      print("ApiService() - API 호출 실패 : $e");
      return null;
    }
  }

}