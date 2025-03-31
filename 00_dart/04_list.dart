void main() {
  // 비어 있는 리스트 생성
  List<int> numbers1 = []; // var numbers1 = <int>[]; (동일한 방법)
  print(numbers1);

  // 초기값을 설정한 리스트 생성
  List<int> numbers2 = [10, 20, 30];
  print(numbers2);

  // 고정 길이 리스트 생성
  List<int> numbers3 = List.filled(5, 0); // 길이(size) = 5, 초기값(value) = 0;
  print(numbers3); // [0, 0, 0, 0, 0]

  // 동적 리스트 생성
  List<int> numbers4 = List.generate(5, (index) => index * 10);
  // 길이(size) = 5, 각 요소 값 = (index) => index * 10 함수의 반한 값
  print(numbers4); // [0, 10, 20, 30, 40]

  // Nullable 리스트 (각 항목 뒤에 ?를 붙여 List도 null이 될 수 있고, 요소(int)도 null이 될 수 있다.)
  List<int?>? numbers5 = [1, null, 3];
  print(numbers5);

  // numbers5가 null이 아니거나 비어있지 않다면 for문 동작
  if (numbers5 != null && numbers5.isNotEmpty) {
    for (dynamic element in numbers5) {
      // element가 null이 아니면 그대로 쓰고, null이면 0을 쓴다. (결과: 1, 0 ,3)
      print(element ?? 0);
    }
  }

  // 리스트 조작하기
  List<int> list = [1, 2]; // 쉼표로 끝내기 가능

  // 단일 요소 추가
  list.add(3); // 마지막 요소에 3 추가

  // 다중 요소 추가
  list.addAll([4, 5]); // 마지막 요소들로 4,5

  // 특정 위치에 요소 추가
  list.insert(0, 0); // insert(index, value) 인덱스 0 위치에 값 0을 추가
  print(list); // [0, 1, 2, 3, 4, 5]

  // 특정 값을 가진 요소 삭제
  list.remove(3);

  // 특정 인덱스 요소 삭제
  list.removeAt(0);
  print(list); // [1, 2, 4, 5]

  // 리스트 비우기
  list.clear();
  print(list); // []

  list.addAll([1, 2, 3]);
  // 리스트 크기
  print(list.length);

  // 리스트 첫 요소
  print(list.first);

  // 리스트 마지막 요소
  print(list.last);
}
