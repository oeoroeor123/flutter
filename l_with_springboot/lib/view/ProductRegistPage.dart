import 'package:flutter/material.dart';
import 'package:l_with_springboot/model/Product.dart';
import 'package:l_with_springboot/viewmodel/ProductProvider.dart';
import 'package:provider/provider.dart';

class ProductRegistPage extends StatelessWidget {

  ProductRegistPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Registration")
      ),
      body: Form(
        key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "상품명"),
            validator: (String? value) => value!.isEmpty ? "상품명 입력" : null , // 공백 검사
            controller: _nameController,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "상품가격"),
            validator: (String? value) => int.parse(value!) <= 0 ? "상품가격 오류" : null , // 입력 검사
            controller: _priceController,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "상품개요"),
            validator: (String? value) => value!.isEmpty ? "상품개요 입력" : null, // 공백 검사
            controller: _descriptionController,
          ),
          SizedBox(height: 50),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 뒤로가기
                  },
                  child: const Text("취소")
              ),
              ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) { // Form 내부의 모든 TextFormField의 validator 콜백 결과를 모두 통과하면
                      context.read<ProductProvider>().registProduct(
                        Product(
                            name: _nameController.text,
                            price: int.parse(_priceController.text),
                            description: _descriptionController.text,
                        )
                      );
                      Navigator.of(context).pop(); // 뒤로 가기
                    }
                  },
                  child: const Text("등록")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
