import 'package:mr_candy/features/Home/data/models/category_Products_model.dart';

class CartModel{
final int id ;
final int quantity;
final CategoryProductsModel categoryProductsModel;


CartModel
    ( {
  required this.id,
  required this.quantity,
  required this.categoryProductsModel,


});


factory CartModel.fromJson(Map<String ,dynamic> json){
  return CartModel(
      id: json["id"], 
      quantity:json ["quantity"],
      categoryProductsModel: CategoryProductsModel.fromJson(json["product"],),

     );
}
}
