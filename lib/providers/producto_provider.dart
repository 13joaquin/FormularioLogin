import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:formulariologin/models/product.dart';
import 'package:formulariologin/models/models.dart';
import 'package:http/http.dart' as http;
class ProductoProviader extends ChangeNotifier{
  String _Url = '';
  List<Productos> listaproductos = [];
  ProductoProviader() {this.ProductosG();}

  Future<String> _JsonData(String _endpoint) async {
    final _url = Uri.http(_Url,_endpoint);
    final response = await http.get(_url);
    return response.body;
  }
  ProductosG() async{
    final jsonData = await this._JsonData('/productos.json');
    final Pproductos = productosFromJson(jsonData);
    listaproductos = Pproductos;
    notifyListeners();
  }
}