import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../category.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.categories;
    return Scaffold(
     body: ListView.builder(
          itemCount: categories.length,
          itemBuilder:(context,index){
            Category category = categories[index];
           return ListTile(
              title: Text(category.name),
              onTap: (){
                //context.goNamed will work same
                return context.go(
                    context.namedLocation(
                    'product_list',
                    params: <String,String>{
                      'category':category.name
                    },
                      queryParams: <String,String>{
                      'sort':'desc',
                        'filter':'0'
                      },
                    )
                );
                },
            );
          })
    );
  }
}
