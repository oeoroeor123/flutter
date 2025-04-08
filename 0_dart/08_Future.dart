// Future
// 비동기 프로그래밍을 지원하는 다트의 클래스입니다.

// 비동기 함수
// 1. async 키워드로 정의된 함수에서 Future를 반환합니다.
// 2. await 키워드를 이용해 Future의 완료를 기다리거나, then() 메소드를 사용하여 완료 결과를 처리합니다.

// 비동기 함수 정의
Future<String> delay1() async {
  // 2초 간 딜레이
  await Future.delayed(Duration(seconds: 2));
  return "Delay Complete";
}

// late 키워드와 비동기 함수 정의
late String data; // late : data 변수는 나중에 값이 채워집니다.
Future<void> delay2() async {
  await Future.delayed(Duration(seconds: 2));
  data = "딜레이 완료";
}

void main() async { // main() 함수의 비동기 함수화가 필요합니다.

  // 1. await 으로 비동기 함수 결과 기다리기
  String res = await delay1();
  print(res);

  // 2. then() 메소드로 비동기 함수 결과 처리하기
  delay1().then((value) {
    // 매개변수로 비동기 함수의 return 값이 넘어옵니다.
    print(value);
  });

  // 3. catchError() 메소드로 에러 처리하기
  delay1()
      .then((value) {
        print(value);
      })
      .catchError((error) {
        print('오류 발생 : ${error}');
      });
  
  // 4. late 변수 확인
  await delay2();
  print(data);
  
}
