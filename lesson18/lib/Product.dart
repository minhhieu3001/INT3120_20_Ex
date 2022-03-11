class Product {
  final int id;
  final String name;
  final String image;
  static final columns = ["id", "name", "image"];
  Product(this.id, this.name, this.image);
  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      data['id'],
      data['name'],
      data['image'],
    );
  }
  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "image": image
  };
}