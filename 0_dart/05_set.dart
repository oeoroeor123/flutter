void main() {
  
  // 비어 있는 세트 생성
  Set<int> set1 = {}; // var set1 = <int>{};
  print(set1);

  // 초기값을 가진 세트 생성
  Set<int> set2 = {1, 10, 100, 100, 100}; // {1, 10, 100}
  print(set2);

  // 세트의 요소는 인덱스가 없습니다. (순서를 보장하지 않습니다.)
  Set<String> set3 = {"kiwi", "banana", "apple", "tomato"};
  print(set3);
  
  // 세트 -> 리스트
  List<String> fruits = set3.toList();
  print(fruits);
  
  // 세트 조작 메소드 : 리스트 조작 메소드와 동일한 구성
  
  // 수학 집합 메소드
  // 1. 합집합(union)        : setA.union(setB)
  // 2. 교집합(intersection) : setA.intersection(setB)
  // 3. 차집합(difference)   : setA.defference(setB)
  
}
