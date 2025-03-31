// 함수
// 1. 기본 함수 선언
int add1(int a, int b) {
  return a + b;
}

// 2. 매개변수 타입 생략 (dart가 추론해서 결정)
int add2(a, b) {
  return a + b;
}

// 3. 반환 타입 생략 (dart가 추론해서 결정)
add3(a, b) {
  return a + b;
}

// 4. 화살표 함수 ( 문법 : () => 단일표현식 )
// 항상 단일표현식의 결과값을 반환 (return 필요 없음)
int add4(int a, int b) => a + b;

// 5. 블록 바디 함수 ( 문법 : () {} )
// 여러 줄의 함수 본문이 필요한 경우에 사용 (반환 시, return 명시 필요)
int add5(int a, int b) {
  int res = a + b;
  return res;
}

// 6. 순서가 있는 positional parameter
void info1(String name, int age) {
  print("name: ${name}, age: ${age}");
}

// 7. 이름이 있는 named parameter
// named parameter는 nullable 하므로 Null safe 처리를 해야 한다.
// 방법 : 선언 시 ? 추가, 필수 required 처리, default 값 사용 ...
void info2({String? name, int? age}) {
  print("name : ${name}, age: ${age}");
}

// 8. 생략 가능한 optional parameter
// 생략 가능한 parameter를 []로 묶는다.
// null 처리를 위해 default 값을 자주 사용한다.
void info3(String name, [int age = 30]) { // [int? age] 또는 [int age = 30] 사용 (Null safe 처리)
  print("name : ${name}, age : ${age}");
}

// 9. 생략 불가능한 필수 parameter : required
void info4({required String name, required int age}) {
  print("name : ${name}, age: ${age}");
}

// 10. 콜백
void exeCallback({required Function callback}) {
  callback(); // 콜백 호출
}

// 11. 콜백
void exeHasReturnCallback({Function? callback}) {
  if(callback != null)
  print(callback());
}

void main() {
  print(add1(1, 2));

  print(add2(3, 4));

  print(add3(5, 6));

  print(add4(7, 8));

  print(add5(9, 10));

  info1("sujeong", 30);

  info2(age: 30, name: "sujeong"); // named parameter로 값 전달, 순서 상관 없음

  info3("sujeong"); // age는 생략 가능하기에 작성 x
  
  info4(name: "sujeong", age: 30);
  
  exeCallback(callback: (){
    print("callback called");
  });
  
  exeHasReturnCallback(callback: () => "hello world"); 
}
