// ViewModel : model 과 view 사이에 위치한다. (MVC의 controller 같은 역할)
// model에서 데이터를 가져와서 view에 전달하는 형태로, 상태가 변하면 view에 알린다.
// View는 상태값이 변하면 리 빌드된다.

// changeNotifier : 상태 변경을 알리는 클래스
import 'package:f_provider/Model/CounterModel.dart';
import 'package:flutter/material.dart';

class CounterViewModel with ChangeNotifier {

  // Model 인스턴스 생성
  final CounterModel _counterModel = CounterModel();

  // getter (CounterModel의 _count 값의 getter)
  // 바로 _count 부르기 불가, _counterModel.에 count로 부른다.
  int get count => _counterModel.count;

  // 메소드
  void increment() {
    _counterModel.increment(); // model의 메소드를 호출(상태 변경됨)
    notifyListeners(); // view에 상태 변화를 알림
  }

  void decrement() {
    _counterModel.decrement();
    notifyListeners();
  }

  void reset() {
    _counterModel.reset();
    notifyListeners();
  }

}
