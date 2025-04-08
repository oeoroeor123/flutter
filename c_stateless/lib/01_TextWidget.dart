import 'package:flutter/material.dart';

// Text
// 텍스트를 화면에 표시하는 기본 위젯입니다.
// 텍스트에 다양한 스타일을 지정하여 화면에 렌더링 할 수 있습니다.
// 주요 속성
// 1. style : TextStyle 클래스를 이용하여 텍스트 크기, 색상, 두께 등을 설정
// 2. textAlign : 텍스트 정렬 설정
// 3. overflow : 텍스트가 지정된 공간을 넘칠 경우 처리 방법
//               TextOverflow.clip : 자름 (디폴트)
//               TextOverflow.ellipsis : 말줄임표(...)
//               TextOverflow.fade : 점점 투명하게
//               TextOverflow.visible : 넘쳐도 그대로 표시
// 4. softwrap : 자동 줄바꿈 여부 (true : 활성화(디폴트), false : 비활성화)
// 5. maxLines : 최대 줄 수 제한

// 글꼴 등록 방법
// 1. assets/fonts/D2Coding.ttf 폰트 파일 준비
// 2. pubspec.yaml 파일 열기
//    flutter:
//      # 폰트 등록
//      fonts:
//        - family: D2Coding  # 사용할 폰트의 이름
//          fonts:
//            - asset: assets/fonts/D2Coding.ttf
//              weight: 400
// 3. 필요한 위젯에서 fontFamily 등록
// 4. 애플리케이션의 기본 폰트로 등록하려면 아래와 같이 등록
//    MaterialApp(
//      theme: ThemeData(
//        fontFamily: "D2Coding",
//        textTheme: TextTheme(
//          headlineLarge: TextStyle(fontWeight: FontWeight.w400),
//        ),
//      ),
//    )

class TextWidget extends StatelessWidget {

  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900, // 굵기 
        fontStyle: FontStyle.italic, // 기울임
        fontFamily: "D2Coding", // 폰트
      ),
      textAlign: TextAlign.center, // 가운데 정렬
      overflow: TextOverflow.ellipsis, // 텍스트 길이가 길 경우 처리 방법
      softWrap: false, // 자동 줄바꿈 비활성화 (true,false로 나눔)
      maxLines: 1, // 최대 줄 수 제한
    );
  }
}