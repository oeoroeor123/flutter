import 'package:d_stateful/01_decrement.dart';
import 'package:d_stateful/01_increment.dart';
import 'package:d_stateful/01_reset.dart';
import 'package:d_stateful/01_state_button.dart';
import 'package:flutter/material.dart';

// statefulWidget
// 1. 개념
// Flutter에서 상태를 가지는 위젯을 정의할 때 사용하는 클래스
// 내부 상태를 가질 수 있으며 상태에 따라서 UI가 동적으로 변경된다.
// 사용자와의 상호 작용, 네트워크 요청 결과 등으로 UI가 변하는 상황에서 사용한다.
// 2. 특징
// 1) 상태 관리 : 상태는 state 객체에서 저장하며, state 객체가 statefulWidget에 연결된다.
// 2) 생명 주기:  상태가 변경될 때 마다 steState() 메소드를 호출해서 상태를 변경하고 UI를 업데이트한다.
// 3) 구조
// ① statefulWidget : state 생성 및 위젯의 기본 구조 정의
// ② state : 상태 관리 및 UI 빌드
// 3. 사용 방법
// 1) statefulWidget 클래스 생성
// 2) state 클래스 생성
// 3) statefulWidget 클래스에서 state 클래스 등록
// 4) state 클래스에서 상태 관리 및 UI 빌드

// 1. statefulWidget 클래스 생성
class statefulIntro extends StatefulWidget { // main.dart에 처음 만든 statefulIntro(위젯) 클래스를 넘겨준다.

  const statefulIntro({super.key});

  // 3. createState() 메소드 오버라이드
  @override
  State<StatefulWidget> createState() { // 좀 더 명확하게 짜고 싶을땐, 메소드 앞을 _statefulIntroState 로 바꾼다.
    return _statefulIntroState(); // createState 메소드를 사용해 내가 만든 state 클래스를 return한다.
  }
}

// 2. state 클래스 생성
// 비공개(private) : 밑줄(_)로 시작하는 식별자(변수, 함수, 클래스, 메소드 등)
class _statefulIntroState extends State<statefulIntro> { // state<>에 statefulIntro 를 타입으로 넘겨준다.

  // 4. 상태 정의 및 UI 빌드
  int _count = 0; // 상태 _count

  // setState() : 메소드 내부에 변수 변환을 넣거나 / 변환 처리 먼저 하고 메소드를 사용하거나 (2가지 방법 가능)
  // 증가 함수
  void _increment() {
    setState(() {
      _count++; // 메소드 내부에 변수 변환 넣기
    });
  }

  // 감소 함수
  void _decrement() {
    setState(() {
    _count--;
    });
  }

  // 리셋 함수
  void _reset() {
    _count = 0;      // 변수 변환 먼저 처리하고,
    setState(() {}); // UI 업데이트를 위해서 setState() 메소드 호출
  }

  @override // build
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("현재 _count 값 = $_count"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // 각 버튼 가운데 정렬

            children: [
              // IncrementButton(onPressed: _increment), // 모듈화 처리

              StateButton(onPressed: _increment, type: 1), // 모듈 한번에 처리

              ElevatedButton(
                  onPressed: _increment
                  , child: const Text("+"),
              ),

              // DecrementButton(onPressed: _decrement), // 모듈화 처리

              StateButton(onPressed: _decrement, type: 2), // 모듈 한번에 처리

              ElevatedButton(
              onPressed: _decrement
              , child: const Text("-"),
          ),

              // ResetButton(onPressed: _reset), // 모듈화 처리

              StateButton(onPressed: _reset, type: 3), // 모듈 한번에 처리

              ElevatedButton(
                  onPressed: _reset
                  , child: const Text("Reset"),
              ),
            ],
          )
        ],
      )
    );
  }


}

