import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mr_candy/core/errors/failure.dart';
import 'package:mr_candy/core/utils/endpoints.dart';
import 'package:mr_candy/features/Home/data/models/banners_model.dart';
import 'package:mr_candy/features/Home/data/models/category_Products_model.dart';
import 'package:mr_candy/features/Home/data/models/category_model.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo.dart';
import 'package:http/http.dart'as http;
import 'package:mr_candy/features/cart/data/models/cart_products_model.dart';

class HomeRepoImplementation extends HomeRepo{
  @override
  Future<Either<Failure, List<BannersModel>>> banners() async{
    List<BannersModel> bannerlist=[];
  try{
    var result = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.banners)
    );



    var body= jsonDecode(result.body);


    if(body["status"]){

      for(var data in body["data"]){
        bannerlist.add(
            BannersModel(id: data["id"],
            image: data["image"], category:null,
            product: null));
      }

     return right(bannerlist);
    }
    else{
      return left(ApiFailure(errormessage: "errormessage"));

    }
  }
  catch(e){

return left(ApiFailure(errormessage: "Oops error"));
  }





  }

  @override
  Future<Either<Failure, List<CategoryModel>>> Categorys()async {

    List<CategoryModel> categorylist =[];
   try{

     var result= await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.categories));

     var body= jsonDecode(result.body);
     if(body["status"]){
       for (var data in body["data"]["data"]){
         categorylist.add(
           CategoryModel(id: data["id"], name: data["name"], image:data["image"])
         );

       }
       return right(categorylist);
     }else{
       return left(ApiFailure(errormessage: "cannot display categories"));

     }


   }catch(e){
     print(e.toString());
     return left(ApiFailure(errormessage: "api error"));
   }
  }

  @override
  Future<Either<Failure, List<CategoryProductsModel>>> categoryProducts({required int id}) async{
    List<CategoryProductsModel> categoryProductsList=[];

    try{
     
      var result = await http.get(Uri.parse("${EndPoints.baseUrl}${EndPoints.categories}/$id"));


      var body= jsonDecode(result.body);
      print("${body}");
      if(body["status"]){
        for (var data in body["data"]["data"]){
          CategoryProductsModel categoryproduct =  CategoryProductsModel.fromJson(data);
          categoryProductsList.add(
             categoryproduct
          );

        }
        return right(categoryProductsList);
      }else{
        return left(ApiFailure(errormessage: "cannot display categoriesDetails"));

      }


    }catch(e){
      print(e.toString());
      return left(ApiFailure(errormessage: "api error"));
    }
  }

  @override
  Future<Either<Failure, CategoryProductsModel>> productsDetails({required int productid}) async{

    try{
      var result = await http.get(Uri.parse("${EndPoints.baseUrl}${EndPoints.products}/$productid"));

      var body= jsonDecode(result.body);
      print("${body}");
      if(body["status"]){

        var data = body["data"];

          CategoryProductsModel products = CategoryProductsModel.fromJson(data);
          return right(products);

      }else{
        return left(ApiFailure(errormessage: "cannot display products details"));
      }
    }

        catch(e){
      return left(ApiFailure(errormessage: "api error")) ;
        }
  }

  @override
  Future<Either<Failure, List<CartModel>>> displayCarts() async{

    List<CartModel> cartList =[];
    //cartList.clear();
    final box = Hive.box("setting");
    String? token = box.get("token");
   try{

     var result = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.carts),

       headers: {
       "Authorization" :token! });

     var body = jsonDecode(result.body);

     if(body["status"]){

       for(var data in body["data"] ["cart_items"]  ){

         cartList.add(CartModel.fromJson(data));

       }
       return right(cartList);

     }
     else {
       return left(ApiFailure(errormessage: "Failed to load cart items"));
     }

   }
   catch(e){
     return left(ApiFailure(errormessage: "API error occurred while fetching carts"));
   }
  }

  Future<Either<Failure, String>> addOrRemoveCarts({required int id}) async{

    final box = Hive.box("setting");
    String? token = box.get("token");
    try{

      var result = await http.post(Uri.parse(EndPoints.baseUrl+EndPoints.carts),
          body: {
            "product_id" : id
          },
          headers: {
            "Authorization" :token! }
      );


      var body = jsonDecode(result.body);

      if(body["status"]){
       var data = body["message"];

        return right(data);

      }
      else {
        return left(ApiFailure(errormessage: body["message"] ));
      }

    }
    catch(e){
      return left(ApiFailure(errormessage: "API error "));
    }
  }







}




