import 'package:dartz/dartz.dart';

import 'package:mr_candy/core/errors/failure.dart';
import 'package:mr_candy/features/Home/data/models/banners_model.dart';
import 'package:mr_candy/features/Home/data/models/category_Products_model.dart';
import 'package:mr_candy/features/Home/data/models/category_model.dart';
import 'package:mr_candy/features/cart/data/models/cart_products_model.dart';

abstract class HomeRepo {


  Future<Either<Failure,List<BannersModel>>> banners ();


  Future<Either<Failure,List<CategoryModel>>> Categorys();

  Future<Either<Failure,List<CategoryProductsModel>>> categoryProducts({required int id});

  Future<Either<Failure,CategoryProductsModel>> productsDetails({required int productid});

  Future<Either<Failure,List<CartModel>>> displayCarts();

  Future<Either<Failure,String>> addOrRemoveCarts({required int id});

}

