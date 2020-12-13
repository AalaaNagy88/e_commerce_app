import 'package:e_commerce_app/services/store.dart';

Future<String> uploadImage(context)async{
  final _store = Store();

  return await _store.uploadImage(context);
}