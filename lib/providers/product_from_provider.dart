import 'package:flutter/material.dart';
import 'package:formulariologin/models/product.dart';

class ProductFromProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  //late
  Productos product =
  new Productos(available: false, name: '', picture: '', price: 0, id: '');
  bool available = false;
  String name = '';
  //String picture = '';
  double price = 0;
  //String id = '';
// this.product
  ProductFromProvider();
  UpdateAvailability(bool value){
    print(value);
    this.product.available = value;
    notifyListeners();
  }
  bool? isValidForm(){
    print(product.name);
    print(product.price);
    print(product.available);
    return formKey.currentState?.validate();
  }
}