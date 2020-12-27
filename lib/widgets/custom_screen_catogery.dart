import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_search_bar.dart';

class CustomScreenCatogery extends StatelessWidget {
  final String title;
  final String catogeryName;
  const CustomScreenCatogery({Key key, this.title,this.catogeryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<ProductModel> customList=getItemsBasedInCatogery(catogeryName,Provider.of<ProductItem>(context).productList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.givewidth(context, .05)),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black54),
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
                child:GridView.builder(
                  itemCount: customList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (context, i) {
                    ProductModel product =customList[i];
                    return ProductCard(product: product,isAdmin: false,);
                  },
                )
            ),
          ),
        ],
      )
    );
  }

  List<ProductModel>getItemsBasedInCatogery(String catogeryName,List<ProductModel> list){
    List<ProductModel> newList=[];
    for(ProductModel item in list){
      if(item.category==catogeryName){
        newList.add(item);
      }
    }
    return newList;
  }
}
