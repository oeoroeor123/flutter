void main() {
  // 비어 있는 세트 생성
  Set<int> set1 = {}; // var set1 = <int>{}; (동일한 방법)
  print(set1);

  // 초기 값을 가진 세트 생성
  Set<int> set2 = {1, 10, 100, 100, 100}; // {1, 10, 100}; 중복 제외하고 생성됨
  print(set2);

  // 세트의 요소는 인덱스가 없다. (순서를 보장하지 않는다.)
  Set<String> set3 = {"banana", "apple", "kiwi", "tomato", "strawberry"};
  print(set3);

  // 세트 -> 리스트로 변경
  List<String> fruits = set3.toList();
  print(fruits);

  // 세트 조작 메소드 : 리스트 조작 메소드와 동일한 구성을 가진다.
  // 단, 특정 인덱스 요소를 삭제하는 .removeAt()은 존재하지 않는다. (세트의 요소는 인덱스가 없기 때문에)

  // 수학 집합 메소드
  // 1. 합집합(union) : setA.union(setB)
  // 2. 교집합(intersection) : setA.intersection(setB)
  // 3. 차집합(difference) : setA.difference(setB)
}