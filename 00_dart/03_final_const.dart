void main() {
  // 상수 처리
  // 1. final
  // 값 할당 후에는 변경할 수 없다.
  // build 타입에는 값이 없어도 된다.

  final int x; // 최초 final 선언 시 초기값 생략 가능
  // 타입(String, int ...) 생략 가능 (ex_final x;)
  x = 1; // 아래에서 초기값 할당 가능 (이후 변경 불가)
  print(x);
  // x = 2; // 이후 할당 불가능
  // print(x);

  // 2. const
  // 값 할당 후에는 변경할 수 없다.
  // build 타입에는 값을 가지고 있어야 한다.

  const int y = 2; // 최초 const 선언 시 값을 할당해야 한다.
  print(y);
  // y = 10; // 이후 할당 불가능
  // print(y);
}
