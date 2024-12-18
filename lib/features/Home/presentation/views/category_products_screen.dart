import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/core/shared_widgets/custom_appbar.dart';
import 'package:mr_candy/features/Home/presentation/views/widgets/categories_products_gridview.dart';

import '../controller/categoriesproducts/categories_products_cubit.dart';
import '../controller/categoriesproducts/categories_products_states.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({super.key, required this.name, required this.id});

  final String name;
  final int id;

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CategoriesProductsCubit>(context)
        .getCategoriesDetails(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      
      textDirection: TextDirection.rtl,

      child: Scaffold(
        body: CustomScrollView(
          slivers: [
      
            SliverToBoxAdapter(
              child: CustomAppBar(name: widget.name),
            ),
      
         SliverToBoxAdapter(child: SizedBox(height: 20,)),
            BlocConsumer<CategoriesProductsCubit, CategoriesProductsStates>(
      
              listener: (BuildContext context, CategoriesProductsStates state) {
                if(state is CategoriesProductsFailureState){
                  if (state is CategoriesProductsFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errormessage)),
                    );
                  }
      
                }
              },
      
              builder: (BuildContext context, CategoriesProductsStates state) {
      
      
                if (state is CategoriesProductsLoadingState){
                  return SliverToBoxAdapter(
                    child: Center(
                      child:  CircularProgressIndicator(),
                    ),
                  );
      
                }else if (state is CategoriesProductsSuccessState){
      
                  if (state.categoryproductsmodel.isNotEmpty){
      
                  return CategoryProductsGridView(categoryproductmodel: state.categoryproductsmodel);
                  }
                  else{
      
                    return SliverToBoxAdapter(
                      child: Center(child: Text("لا توجد بيانات لعرضها"),
                      ),
                    );
                  }
                }
                else {
                  return SliverToBoxAdapter(
                    child: Center(child: Text("لا توجد تفاصيل لهذه الفئة")),
                  );
                }
      
              },
      
            ),
          ],
        ),
      ),
    );
  }
}
