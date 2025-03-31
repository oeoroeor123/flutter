void main() {
  // Non-nullable
  String name1;
  name1 = "james";
  print(name1);
  // name1 = null; null이 불가능하다.

  // Nullable(? 붙이기)
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
  print(str?.length); // str이 null이 아니면 length 속성을 사용한다.

  // 3. null 선택 연산
  print(str ?? "emma"); // str이 null이면 "emma"를 반환한다.

  // 4. null 선택 할당 연산
  str ??= "emma"; // str이 null이면 "emma"를 할당한다.
  print(str);

  // 5. null 단언 연산
  print(str!.length); // dart에게 str은 null이 아님을 알린다. 만약 null이라면 Runtime 오류가 발생한다.

  // 동적 할당 변수 키워드 dynamic과 null (dynamic에는 ?를 쓰지 않는다.)
  dynamic dy; // dynamic은 기본적으로 nullable이므로 ?를 붙이는 것은 의미가 없다.
  dy = null;
  dy = 10;
  print(dy);
}
