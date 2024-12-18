class CategoryProductsModel {
  final int id;
  final double price;
  final double old_price;
  final int discount;
  final String image;
  final String name;
  final String desc;



  CategoryProductsModel({
    required this.id,
    required this.price,
    required this.old_price,
    required this.discount,
    required this.image,
    required this.name,
    required this.desc,

  }
  );


  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductsModel(
    id: json['id'] as int,
    price: (json['price'] as num).toDouble(),
    old_price: (json['old_price'] as num).toDouble(),
      discount: json['discount'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      desc: json['description'] as String,
    );
  }

}