import 'package:flutter/material.dart';

// showDialog() 함수
// 각종 다이얼로그(대화상자)를 표시하는 데 사용되는 함수입니다.
// 비동기적으로 대화상자를 열고 사용자가 대화상자를 닫을 때까지 대기할 수 있습니다.
// Future<T>를 반환하여 대화상자에서 선택한 결과를 처리할 수 있습니다.
// 함수 원형
// Future<T?> showDialog<T>({
//   required BuildContext context,
//   required Widget Function(BuildContext) builder,
//   bool barrierDismissible = true,
//   ...
// })
// 필수 속성
// 1. context : 현재 위젯의 BuildContext
// 2. builder : 대화상자의 내용을 정의하는 함수로 대화상자를 반환해야 함

// AlertDialog
// 플러터에서 사용자에게 중요한 정보를 알리거나 선택을 요구할 때 사용하는 팝업 창입니다.
// 일반적으로 showDialog() 함수와 함께 사용됩니다.
// 주요 속성
// 1. title : 대화 상자의 제목
// 2. content : 대화 상자의 본문 내용
// 3. actions : 사용자가 선택할 수 있는 버튼 목록 제공

class DialogWidget extends StatelessWidget {

  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {

    /*
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop("Hello World"); // 대화상자를 닫으면 "Hello World"를 반환한다.
                    },
                    child: const Text("확인"),
                ),
              );
            }
        ).then((res) { // showDialog가 Future<>를 반환(promise 같은), .then 메소드로 반환된 "Hello World"가 전달된다.
          print(res);
        });
    },
      child: const Text("대화상자 열기"),
    );
     */

    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("알림 제목"),
                  content: const Text("알림 내용"),
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop("ok");
                        },
                        child: const Text("확인"),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop("cancle");
                        },
                        child: const Text("취소"),
                    ),
                  ],
                );
              }
          ).then((res) {
            print(res);
          });
        },
        child: const Text("대화상자 열기"),
    );
  }
}