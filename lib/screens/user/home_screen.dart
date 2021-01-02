import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/product_item_provider.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:e_commerce_app/widgets/custom_screen_catogery.dart';
import 'package:e_commerce_app/widgets/custom_search_bar.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'cart_screen.dart';
import 'local_widget/catogery_card.dart';
import 'local_widget/drawer_details.dart';
import 'local_widget/home_titles.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserOperations _userOperations = UserOperations();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _userOperations.loadAllCartItems(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = Provider.of<ProductItem>(context).productList;
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
              onPressed: () =>
                  Navigator.pushNamed(context, CartScreen.routeName),
            )
          ],
        ),
        drawer: DrawerDetials(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
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
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomScreenCatogery(
                                    title: "Women Items",
                                    catogeryName: "Women",
                                  ))),
                    ),
                    CatogeryCard(
                      color: kMenCat,
                      name: "men",
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomScreenCatogery(
                                    title: "Men Items",
                                    catogeryName: "Men",
                                  ))),
                    ),
                    CatogeryCard(
                      color: kKidsCat,
                      name: "kids",
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomScreenCatogery(
                                    title: "Kids Items",
                                    catogeryName: "Kids",
                                  ))),
                    ),
                  ],
                ),
              ),
              HomeTitles(name: "Featured"),
              Container(
                  height: 260,
                  child: ListView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      ProductModel product = products[i];
                      int x = int.parse(product.price.trim());
                      return x <= 500
                          ? ProductCard(
                              product: product,
                              isAdmin: false,
                            )
                          : null;
                    },
                  )),
              HomeTitles(name: "Best Sell"),
              Container(
                  height: 260,
                  child: ListView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      ProductModel product = products[i];
                      int x = int.parse(product.price.trim());
                      return x >= 200
                          ? ProductCard(
                              product: product,
                              isAdmin: false,
                            )
                          : null;
                    },
                  )),
            ],
          ),
        ));
  }
}
