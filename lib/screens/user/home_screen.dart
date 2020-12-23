import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';
import 'package:e_commerce_app/widgets/custom_search_bar.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'local_widget/catogery_card.dart';
import 'local_widget/home_titles.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "HomeScreen";
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.sort,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomSearchBar(),
            SizedBox(
              height: 10,
            ),
            HomeTitles(name: "Categories"),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CatogeryCard(
                    color: kWomenCat,
                    name: "women",
                  ),
                  CatogeryCard(
                    color: kMenCat,
                    name: "men",
                  ),
                  CatogeryCard(
                    color: kKidsCat,
                    name: "kids",
                  ),
                ],
              ),
            ),
            HomeTitles(name: "Featured"),
            StreamBuilder<QuerySnapshot>(
                stream: _store.loadAllProducts(),
                builder: (context, snapshots) {
                  if (snapshots.hasData) {
                    List<QueryDocumentSnapshot> lisData = snapshots.data.docs;
                    return GridView.builder(
                      itemCount: lisData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: .7),
                      itemBuilder: (context, i) {
                        ProductModel product =
                        ProductModel.fromJson(lisData[i].data(),lisData[i].id);
                        return ProductCard(product: product);
                      },
                    );
                  } else
                    return Center(child: CircularProgressIndicator());
                }),
            Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [],
                )),
            HomeTitles(name: "Best Sell"),
          ],
        ));
  }
}
