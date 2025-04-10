import 'package:flutter/material.dart';
import 'package:l_with_springboot/model/Product.dart';
import 'package:l_with_springboot/viewmodel/ProductProvider.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {

  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Provider 등록
    // context로 위젯 트리에 있는 것 전체 가져올 수 있는데, .read로 ProductProvider만 꺼내서 사용
    final productProvider = context.read<ProductProvider>();

    // 최초 빌드 시점에서 Product 목록 로드하기
    WidgetsBinding.instance.addPostFrameCallback((duration) { // 매개변수 duration을 사용하지 않는다면 (_) {}로 표기

      if(productProvider.products.isEmpty) { // 상품 목록이 비어 있으면
      productProvider.fetchProducts(); // 상품 목록 가져오기
      }
    });

    // UI 빌드
    return Scaffold(
      appBar: AppBar(title: const Text ("Product App")),
      // consumer를 이용해 상태 변경 값만 리빌드 처리 (생략 시, 전체 리빌드 처리)
      body: Consumer<ProductProvider>(
          builder: (context, provider, child) { // provider = ProductProvider

            // builder()는 항상 화면에 표시할 UI를 반환
            if(provider.products.isEmpty) {
              return const Center(child: CircularProgressIndicator()); // 화면에 원 형태의 로딩 표시
            }
            // 메모리가 추가될 때 마다 해당 데이터만 추가되는 메모리 성능 향상 코드 (ListView.builder)
            return ListView.builder(
                itemCount: provider.products.length,
                itemBuilder: (context, index) { // itemBuilder의 역할 : product 하나를 만들어서 UI로 반환
                  final product = provider.products[index]; // product
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), // 상하: 4, 좌우: 8 여백 따로 주기
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      leading: Checkbox(
                          value: true, onChanged: (value) {},
                      ), // 앞 부분
                      title: Text(product.name, style: TextStyle(fontWeight: FontWeight.w900)),
                      subtitle: Text(product.price.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "/modify",
                                  arguments: product,
                                );
                              },
                              icon: const Icon(Icons.edit, color: Colors.blue),
                          ),
                          IconButton(
                            onPressed: () {
                              _showDiallogDelete(context, product.id);
                            },
                            icon: const Icon(Icons.delete_forever, color: Colors.red),
                          ),
                        ],
                      ), // 뒷 부분
                    ),
                  );
                }
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 페이지 이동 : main.dart에서 "/regist" 이름을 찾고 해당 코드로 이동 처리
          Navigator.pushNamed(context, "/regist");
        },
        child: const Icon(Icons.add, color: Colors.deepPurple),
      ),
    );
  }

  void _showDiallogDelete(BuildContext context, int? id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Product Delete"),
            content: const Text("Do you want to delete this Product?"),
            // 버튼 만들기
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // 뒤로가기 (AlertDialog 닫기)
                child: const Text("취소")
              ),
              TextButton(
                onPressed: () {
                  // provider가 가지고 있는 deleteProduct 불러와서 id 넣고 삭제
                  context.read<ProductProvider>().deleteProduct(id!);
                  Navigator.pop(context);
                },
                child: const Text("삭제")
              ),
            ],
          );
        }
    );
  }

}