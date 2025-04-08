import 'package:flutter/material.dart';

// Tooltip
// 사용자에게 추가 정보를 제공하기 위한 위젯입니다.
// UI 요소에 마우스를 길게 누를 때나 탭 할 때 작은 팝업창을 표시합니다.
// 주로 아이콘, 버튼 등 UI 요소에 대한 설명을 제공하는 데 사용됩니다.
// 주요 속성
// 1. message : 툴팁에 표시할 텍스트
// 2. child : 툴팁이 적용될 위젯
// 3. height : 툴팁의 높이
// 4. preferBelow : 툴팁 위치 (true 아래, false 위)
// 5. textStyle : 툴팁 내 텍스트의 스타일
// 6. decoration : 툴팁의 배경과 테두리 스타일
// 7. triggerMode : 툴팁이 화면에 나타나는 시점
//                  TooltipTriggerMode.longpress : 1초 이상 길게 누를 때(디폴트)
//                  TooltipTriggerMode.tap : 탭 할 때
//                  TooltipTriggerMode.manual : hover 할 때 (데스트탑/웹 전용)

class TooltipWidget extends StatelessWidget {

  const TooltipWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Tooltip(
      message: "안내합니다.",
      height: 50,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(2),
        color: Colors.black,
      ),
      child: const Text("Tooltip"),
    );
  }
}