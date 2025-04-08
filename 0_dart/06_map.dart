void main() {
  
  // Map
  // 1. key-value
  // 2. key는 중복 불가능, value는 중복 가능
  // 3. key를 이용해서 value를 조회하는 방식

  // 비어 있는 Map 생성
  Map<String, dynamic> map1 = {}; // var map1 = Map<String, dynamic>()
  print(map1);

  // 초기값을 가진 Map 생성
  Map<String, String> map2 = {
    "KR": "South Korea",
    "US": "United States",
    "JP": "Japan", // 후행 쉼표 가능
  };
  print(map2);
  
  // Map 조작
  
  // key가 존재하는 경우 기존 value의 수정
  map2["KR"] = "Korea";
  
  // key가 없는 경우 새로운 value의 추가
  map2["CA"] = "Canada";
  
  // key를 전달하는 방식의 삭제
  map2.remove("JP");
  
  print(map2);
  
  // 순회 1 : for in 문
  for (String key in map2.keys) {  // keys 속성 : Map의 key만 반환
    print("${key} : ${map2[key]}");
  }
  
  // 순회 2 : forEach() 메소드
  map2.forEach((String key, String value) {
    print("$key : $value");
  }); 
  
}
