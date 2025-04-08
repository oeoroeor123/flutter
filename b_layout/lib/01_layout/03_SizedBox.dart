import 'package:flutter/material.dart';

// SizedBox
// 고정된 크기를 가지는 박스를 만드는 위젯입니다.
// 위젯의 크기 고정 또는 위젯 사이 간격 조정할 때 주로 사용합니다.
// 단, 부모 위젯에 따라서 크기 조정이 되지 않을 수도 있습니다. (예: Column 내부에서는 height만 적용 가능, Row 내부에서는 width만 적용 가능 등)
// 주요 속성
// 1. width : 박스 너비
// 2. height : 박스 높이

// DecoratedBox
// SizedBox가 가지지 못한 테두리나 배경색 등을 지원하기 위한 위젯입니다.
// SizedBox의 자식 위젯으로 DecoratedBox 를 사용하면 됩니다.
// BoxDecoration 객체를 활용해 색상, 테두리, 그림자 등을 설정할 수 있습니다.
// BoxDecoration 주요 속성
// 1. color : 배경색
// 2. border : 테두리
// 3. borderRadius : 모서리 둥글기
// 4. boxShadow : 그림자

class SizedBoxWidget extends StatelessWidget {

  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,  // 적용 안 됨
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red,  // Color(0x80000000) : ARGB 방식
          border: Border.all(
            width: 1.0,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.5),  // black + opacity 50%
              blurRadius: 5,  // 그림자의 흐림 정도 (값이 클수록 부드럽게 퍼지는 그림자이고 값이 작을수록(0에 가까울수록) 선명한 그림자)
              offset: Offset(2, 2),  // 그림자 위치 (x축, y축)
            )
          ],
          borderRadius: BorderRadius.circular(5),
        )
      ),
    );
  }

}