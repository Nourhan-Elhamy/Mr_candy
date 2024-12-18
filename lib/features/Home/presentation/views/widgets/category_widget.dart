import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/features/Home/presentation/controller/categories/categories_cubit.dart';
import 'package:mr_candy/features/Home/presentation/controller/categories/categories_states.dart';
import 'package:mr_candy/features/Home/presentation/views/category_products_screen.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  
  void initState(){
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategory();
  
    
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit,CategoriesStates>(
      listener: ( context,  state) { 
        if(state is CategoriesFailureState ){
          ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(content: Text(state.errormessage)),

          );
        }
      },
      builder: (BuildContext context, state) {
        if (state is
        CategoriesLoadingState) {
          return Center(child: CircularProgressIndicator(),);
        } else if(state is CategoriesSuccessState) {
          return GridView.builder(
            
            itemCount: state.categorymodel.length,
              itemBuilder: (context, index) {
            
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c){
                  return CategoryProducts(name: state.categorymodel[index].name,id: state.categorymodel[index].id,);
                }));
              },
              child: Container(
                width: 79,
                height: 79,

                color: AppColors.offwhite,
                child: Center(
                  child: Column(
                    children: [
                       Image.network(
                          state.categorymodel[index].image,width: 100,
                        ),
                      Text(state.categorymodel[index].name)
                    ],
                  ),
                ),
              ),
            );
          },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,

          ),
          );
        
      }
        return SizedBox();
      }
    );
  }
}
