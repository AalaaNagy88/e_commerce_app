import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/store.dart';

updateProductDetials(ProductModel productModel){
  final _store = Store();
  ProductModel product2 = ProductModel(
      name: productModel.name,
      price: productModel.price,
      description: productModel.description,
      category: productModel.category,
      imageUrl: productModel.imageUrl);
  print(product2.name);
  _store.editProduct(
      productModel.id, product2.toJson());
}