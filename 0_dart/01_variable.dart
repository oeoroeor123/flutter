// 플러터애플리케이션의 진입 함수

void main() {
  
  /*
   * 다트 변수
   * 각 데이터 타입이 명시된 정적 타입입니다.
   * 변수의 타입을 명시하지 않고 사용하는 동적 타입도 가능합니다.
   * 다트의 모든 변수는 사실 객체입니다.
   * 1. 기본 타입 : 정수, 실수, 문자열, 논리
   * 2. 컬렉션 : 리스트, 세트, 맵
   * 3. 사용자 타입 : 클래스
   */

  // 정적 타입
  int iNum = 10;
  double dNum = 1.5;
  String str = 'green'; // "green" 가능
  bool isTrue = true;
  print(iNum);
  print(dNum);
  print(str);
  print(isTrue);

  // 동적 타입 var
  // 할당되는 최초 값의 타입이 그대로 fix 됩니다.
  var va = "blue";
  print(va);
  print(va.runtimeType);

  // 동적 타입 dynamic
  // 할당되는 값의 타입에 따라서 계속 타입이 변합니다.
  dynamic dy = "red";
  print(dy);
  print(dy.runtimeType);
  dy = 10;
  print(dy);
  print(dy.runtimeType);

  // 문자열 보간
  int number = 100;
  print('number = ${number}');

  // 타입 변경 (정수 -> 실수 변경)
  int a = 1;
  double da = a.toDouble();
  print('${a}, ${da}');

  // 타입 변경 (실수 -> 정수 변경)
  double b = 1.0;
  int ib = b.toInt();
  print('${b}, ${ib}');

  // 타입 변경 (숫자 -> 문자열 변경)
  int x = 1;
  String sx = x.toString();
  print(sx);

  // 타입 변경 (문자열 -> 숫자 변경)
  String sNum = "1";
  int si = int.parse(sNum);
  double sd = double.parse(sNum);
  print(si);
  print(sd);
  
}