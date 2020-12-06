class Product {
  String id;
  String name;
  int price;
  String imageUrl;
  String categoryCode;
  String description;
  int inStock;

  Product(
      {this.id,
      this.price,
      this.name,
      this.imageUrl,
      this.categoryCode,
      this.description,
      this.inStock});

  Product.fromMap(Map snapshot, String id)
      : id = id ?? '',
        price = snapshot['price'] ?? 0,
        name = snapshot['name'] ?? '',
        imageUrl = snapshot['imageUrl'] ?? '',
        categoryCode = snapshot['categoryCode'] ?? '',
        description = snapshot['description'] ?? '',
        inStock = snapshot['inStock'] ?? 0;

  toJson() {
    return {
      "price": price,
      "name": name,
      "imageUrl": imageUrl,
      "categoryCode": categoryCode,
      "description": description,
      "inStock": inStock,
    };
  }
}
