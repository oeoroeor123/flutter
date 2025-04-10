// http를 이용해 sprign boot API 서버와 통신하는 서비스

// Spring boot API 서버에서 Flutter의 요청 포트 번호를 5000으로 등록해 두었으므로,
// Flutter의 포트 번호를 5000으로 고정해야 한다. (Spring boot > WebMvcConfig에서 Cors 처리)
// 포트 고정 방법 (플러터에서 진행)
// [Run] - [Edit Configurations] - Additional run args 필드에 인자 등록
// --web-port=5000

// Flutter 앱에서는 동일 기기의 Spring boot API 서버로 요청할 때 localhost를 사용할 수 없다.
// IP 주소를 찾아서 입력하거나, (커맨드에서 ipconfig 명령으로 주소 확인 : 192.168.x.x)
// 에뮬레이터를 이용하는 경우에는 에뮬레이터용 IP 주소(10.0.2.2)를 사용한다.
import 'dart:convert';

import 'package:l_with_springboot/model/Product.dart';
import 'package:http/http.dart' as http;

class ProductAPIService {

  // 사용할 베이스 url
  // 에뮬레이터 이용해 고정 ip 주소(10.0.2.2) 넣고, spring 포트 번호(8080) 넣고,
  // spring boot > controller > request Mapping에서 지정한 주소를 넣어준다.
  final String baseUrl = "http://10.0.2.2:8080/api/products";

  // product 등록 서비스 (반환 타입: controller와 맞추기)
  Future<Product> registProduct(Product product) async {
    final response = await http.post( // post 방식
      Uri.parse("$baseUrl"), // 요청 주소를 Uri 값으로 바꿔서 처리
      headers: { "Content-Type": "application/json" }, // json 타입으로 내용 보내기
      // product.toJson(): product.dart에서 생성한 Map이 반환되는데, 이걸 json 타입으로 encode 한다.
      body: json.encode(product.toJson()), // product -> Map -> Json 문자열로 변환되는 과정
    );
    if(response.statusCode == 200) { // 통신 성공
      // response.body : json으로 바뀐 product 엔티티 (spring boot > controller에서 product 엔티티를 가지고 있음)
      return Product.fromJson(json.decode(response.body)); // Json 문자열 -> Map -> product로 변환되는 과정
    } else {
      throw Exception("Failed to regist Product"); // 통신 실패
    }
  }

  // product 목록 서비스 (반환 타입: controller와 맞추기)
  Future<List<Product>> getProductList() async {
    
    final response = await http.get( // get 방식
      Uri.parse("$baseUrl")); // 목록 가져올 때 Uri 값만 가져온다. (headers 필요 x)
    if(response.statusCode == 200) {
      final List<dynamic> list = json.decode(response.body); // JSON 문자열 -> List<dynamic> (json.decode() 메소드는 dynamic 타입을 반환하기 때문에 List<dynamic> 으로 처리)
      // list : [ { }, { }, ... ]
      // jsonProduct : json 형태의 product { }
      // Product.formJson(jsonProduct) : { } -> Product
      // .toList() : [ Product, Product, ... ]
      return list.map((jsonProduct) => Product.fromJson(jsonProduct)).toList();
    } else {
      throw Exception("Failed to get product list");
    }
  }

  Future<Product> getProductById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));
    if(response.statusCode == 200) {
      return Product.fromJson( json.decode(response.body) );  // JSON 문자열 -> Map -> product
    } else {
      throw Exception("Failed to get product");
    }
  }

  Future<Product> modifyProduct(Product product) async {
    final response = await http.put(
      Uri.parse("$baseUrl/${product.id}"),
      body: json.encode(product.toJson()),  // product -> Map -> JSON 문자열
      headers: { "Content-Type": "application/json" },
    );
    if(response.statusCode == 200) {
      return Product.fromJson( json.decode(response.body) );  // JSON 문자열 -> Map -> product
    } else {
      throw Exception("Failed to modify product");
    }
  }

  Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if(response.statusCode != 200) {
      throw Exception("Failed to delete product");
    }
  }


}

