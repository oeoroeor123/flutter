import 'package:flutter/material.dart';

// ListTile
// 리스트 형태의 항목을 만들기 위해서 사용하는 위젯입니다.
// 주로 ListView 의 각 항목을 나타내는 데 사용됩니다.
// 터치 가능한 영역을 제공하여 사용자가 탭 할 수 있습니다.
// 주요 속성
// 1. leading : 타일의 시작 부분에 표시되는 위젯 (주로 아이콘이나 이미지 활용)
// 2. trailing : 타일의 끝 부분에 표시되는 위젯
// 3. title : 주요 내용
// 4. subtitle : 부가적인 정보 표시

//  VoidCallback 타입의 onTap 속성
//  해당 위젯의 유연성과 재사용성을 높이기 위해서 사용되는 속성입니다.
//  VoidCallback 타입의 onTap 속성은 Flutter 앱 개발에서 널리 사용되는 패턴입니다.
//  주요 특징
//  1. VoidCallback은 매개변수와 반환값이 모두 없는 함수 타입입니다.
//     이를 통해서 버튼을 눌렸을 때 실행될 동작을 위젯 외부에서 정의하고 전달할 수 있습니다.
//  2. 위젯을 사용하는 쪽에서 버튼이 눌렸을 때의 동작을 자유롭게 정의할 수 있습니다.
//  3. 부모 위젯이 자식 위젯의 이벤트에 반응할 수 있게 해주는 효과적인 콜백 패턴입니다.

class ListTileWidget extends StatelessWidget {

  final String title; // non-nullable (필수)
  final String? subtitle; // nullable (선택)
  final VoidCallback? onTap; // nullable (선택)

  const ListTileWidget({
    super.key,
    required this.title, // non-nullable이기 때문에 앞에 required를 붙임
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null, // 삼항연산자 활용, subtitle 뒤에 !를 붙여서 100% null이 아님을 보장
      leading: const Icon(Icons.arrow_forward), // 앞에 붙이기
      trailing: const Icon(Icons.arrow_back), // 뒤에 붙이기
      onTap: onTap, // 탭 눌렀을때 나오는 것
    );
  }
}