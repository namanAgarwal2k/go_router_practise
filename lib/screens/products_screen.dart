import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practise/product.dart';

class ProductListScreen extends StatelessWidget {
 const  ProductListScreen({Key? key,
 required this.category,
   required this.asc,
   required this.quantity,
 }) : super(key: key);


 final String category;
 final bool asc;
 final int quantity;

 @override
  Widget build(BuildContext context) {
    List<Product> products = Product.products
    .where(((product)=>product.category==category))
    .where(((product)=>product.quantity >quantity))
    .toList();

    // products.sort(
    //     (a,b)=>a.name.compareTo(b.name),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        actions: [
          IconButton(onPressed: (){
            String sort = asc ? 'desc':'asc';
            return context.goNamed(
              'product_list',
              params: <String,String>{'category':category},
              queryParams: <String,String>{'sort':sort},
            );
          }, icon: const Icon(Icons.sort)),
          IconButton(onPressed: (){
            return context.goNamed(
                    'product_list',
                    params: <String,String>{'category':category},
                    queryParams: <String,String>{'filter':'10'},
                    );
              }, icon: const Icon(Icons.filter_alt),)
        ],
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          for(final Product product in asc ? products : products.reversed)
            ListTile(
              title: Text(product.name),
            )

        ],
      ),
    );
  }
}
