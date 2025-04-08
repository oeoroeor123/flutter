void main() {
  // Non-nullable
  String name1;
  name1 = "james";
  print(name1);
  // name1 = null;  불가능합니다.

  // Nullable
  String? name2;
  name2 = "alice";
  print(name2);
  name2 = null;

  // Null-safe 연산
  String? str;

  // 1. null 체크
  print(str == null);
  print(str != null);

  // 2. null 확인 후 접근
  /*
  if(str != null) {
    print(str.length);
  }
  */
  print(str?.length); // str 이 null 이 아니면 length 속성을 사용합니다.

  // 3. null 선택 연산
  print(str ?? "emma"); // str 이 null 이면 "emma" 를 반환합니다.

  // 4. null 선택 할당 연산
  str ??= "emma"; // str 이 null 이면 "emma" 를 할당합니다.
  print(str);

  // 5. null 단언 연산
  print(
    str!.length,
  ); // dart 에게 str 은 null 이 아님을 알립니다. 만약 null 이라면 Runtime 오류가 발생합니다.

  // 동적 할당 변수 키워드 dynamic 과 null
  dynamic dy;  // dynamic 키워드에는 기본적으로 nullable 이므로 ?를 붙이는 것은 의미가 없습니다.
  dy = null;
  dy = 10;
  dy = null;
  print(dy);
}
