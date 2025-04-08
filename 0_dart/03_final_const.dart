void main() {

  // 1. final
  // 값을 할당한 후에는 변경할 수 없습니다.
  // build 타임에는 값이 없어도 됩니다.

  final int x; // 최초 final 선언 시 값이 없어도 됩니다.
               // final 선언 시 타입 생략할 수 있습니다. (final x)
  x = 1; // 최초 할당 가능
  print(x);
  // x = 2; 이후 할당 불가능
  
  
  // 2. const
  // 값을 할당한 후에는 변경할 수 없습니다.
  // build 타임에도 값을 가지고 있어야 합니다.
  
  const int y = 2;  // 최초 const 선언 시 값을 할당해야 합니다.
  print(y);
  // y = 10; 이후 할당 불가능
  
}
