import 'package:e_commerce_app/helper/screen_helper.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.givewidth(context, .03),vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: kButtonColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: kMianShadow,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 5))
          ],
        ),
        child: TextField(
          readOnly: true,
          autofocus: true,
          onTap: () => showSearch(context: context, delegate: Search()),
          decoration: InputDecoration(
              hintText: "| Search Your Product",
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search,color:Colors.grey,),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey[200]),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: Colors.grey[200]),
              )),
        ),
      ),
    );
  }
}


class Search extends SearchDelegate {
  ProductModel selectedProduct;
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("test");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> suggestedList=[];
    List<ProductModel>products=Provider.of<ProductItem>(context).productList;
    if(query.isNotEmpty){
      suggestedList.addAll(products.where((element) {return element.name.contains(query);}));
    }
    return query.isEmpty?  Center(child: Text("Type product Name")): ListView.builder(
      itemCount: suggestedList.length,
      itemBuilder: (context,i)=>ListTile(title: Text(suggestedList[i].name),onTap: (){
        selectedProduct=suggestedList[i];
        showResults(context);
      },),
    );
  }
}
