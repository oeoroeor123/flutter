class ResponseData {

  // 데이터 (상태 변수)
  final String name;
  final int count;
  final int age;

  // 생성자
  ResponseData( { required this.name, required this.count, required this.age } );

  // 메소드 (응답 JSON 데이터를 ResponseData 타입의 데이터로 변환 후 반환)
  // factory : 팩토리 생성자를 정의하는 키워드
  // ResponseData.fromJson : 팩토리 생성자의 관습적인 네이밍
  // Map<String, dynamic> json : API 응답 JSON 데이터
  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      name: json["name"] ?? "",
      count: json["count"] ?? 0,
      age: json["age"] ?? 0,
    );
  }

}