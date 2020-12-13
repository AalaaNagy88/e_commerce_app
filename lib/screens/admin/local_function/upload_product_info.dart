import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';

void uploadProductInfo(String name ,String price,String description,String catogery,String imageUrl){
  final _store = Store();
  _store.addNewProduct(ProductModel(
      name: name,
      price: price,
      description: description,
      category: catogery,
      imageUrl: imageUrl));
}