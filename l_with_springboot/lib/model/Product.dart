class Product {

  final int? id; // 상품 등록 시 id는 값이 없는 상태로 Product이 생성됨
  final String name;
  final int price;
  final String description;

  Product({ this.id, required this.name, required this.price, required this.description });

  // JSON to Product(model)
  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
        id: map["id"], // map 대괄호 표기법 사용
        name: map["name"],
        price: map["price"],
        description: map["description"]
    );
  }

  // Product to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name" : name,
      "price" : price,
      "description" : description,
    };
  }
}

