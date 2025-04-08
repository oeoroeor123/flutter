import 'package:flutter/material.dart';

// Image
// 이미지를 화면에 표시할 때 사용하는 위젯입니다.
// 로컬 이미지 파일, 원격 이미지 파일, 인 메모리 이미지 등을 화면에 표시할 수 있습니다.
// 이미지 로드 시 ImageProvider 타입의 객체(AssetImage, NetworkImage, FileImage 등)를 이용합니다.
// 주요 속성
// 1. width : 이미지 너비
// 2. height : 이미지 높이
// 3. fit : 위젯의 크기에 맞춰 이미지 크기 조정
// 4. alignment : 이미지 정렬 방식
// 5. color : 이미지 색상을 바꿈

// ImageProvider 타입 객체
// [1] AssetImage : pubspec.yaml 파일에 등록된 이미지 소스를 로드합니다.
// 주요 특징
// 1. 로컬 이미지 로드 : AssetImage 를 사용하면 프로젝트 내의 assets 폴더에 있는 이미지를 쉽게 로드할 수 있습니다.
// 2. 비동기 로드 : 이미지는 비동기적으로 로드되며, 이미지가 로드되는 동안 사용자에게 다른 ui를 표시할 수 있습니다.
// 3. 캐싱 : AssetsImage 는 이미지를 캐시하여, 동일한 이미지를 여러 번 요청할 때 성능을 최적화합니다.
// [2] NetworkImage : 웹 상의 이미지 소스를 로드합니다.
// 주요 특징
// 1. 원격 이미지 로드 : NetworkImage 를 사용하면 URL 을 통해 인터넷에서 이미지를 로드할 수 있습니다.
// 2. 비동기 로드 : 이미지는 비동기적으로 로드되며, 이미지가 로드되는 동안 다른 UI 요소가 사용자에게 표시될 수 있습니다.
// 3. 캐싱 : 이미지를 캐시하여 동일한 이미지를 여러 번 요청할 때 성능을 최적화합니다.
// 4. 에러 처리 : 네트워크 요청이 실패한 경우, 기본적으로 Image 위젯은 여러 이미지를 표시하거나 빈 공간을 남길 수 있습니다.

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {

    /*
    return const Image(
      image: AssetImage("assets/images/cat.jpg"), // 정적 자원 이미지 경로
      width: 100,
    );
    */

    return SizedBox(
        width: 300,
        child: Image(
          image: NetworkImage("https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"), // 사용할 이미지 주소
          // width: 200,
          color: Colors.green,
          fit: BoxFit.fill,  // 부모 위젯 크기에 맞춤
        )
    );

  }
}