import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:formulariologin/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl ='';
  final List<Productos> products =[];
  late  Productos selectedProductos;
  File? newPictureFiel;
  bool isLoading = true;
  bool isSaving = false;

  ProductService(){
    this.loadProductos();
  }
  Future<List<Productos>> loadProductos() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.http(_baseUrl, 'productos.json');
    final resp = await http.get(url);
    final Map<String,dynamic> productsMap = json.decode(resp.body);
    productsMap.forEach((key, value) {
      final temProduct = Productos.fromMap(value);
      temProduct.id = key;
      this.products.add(temProduct);
    });
    this.isLoading = false;
    notifyListeners();
    return this.products;
  }
  Future saveOrCreateProduct(Productos product) async {
    isSaving = true;
    notifyListeners();
    if(product.id == null){
      await this.CreateProduct(product);
    }
    else{
      await this.UpdateProduct(product);
    }
    isSaving = false;
    notifyListeners();
  }
  Future<String> UpdateProduct(Productos product) async {
    final url = Uri.http(_baseUrl, 'products/${product.id!}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodeData = resp.body;
    //Actualizando los productos
    final index = this.products.indexWhere((element) => element.id == product.id!);
    this.products[index] = product;
    return product.id!;
  }
  Future<String> CreateProduct (Productos product) async {
    final url = Uri.http(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());
    final decodeData = json.decode(resp.body);
    product.id = decodeData['namme'];
    this.products.add(product);
    return product.id!;
  }
  void updateSelectedProductImage(String path){
    this.selectedProductos.picture = path;
    this.newPictureFiel = File.fromUri(Uri(path: path));
    notifyListeners();
  }
  Future<String?> uploadImage() async {
    if(this.newPictureFiel ==  null) return null;
    this.isSaving = true;
    notifyListeners();
    final url = Uri.parse('url to upload file');
    final imageUploadRequest = http.MultipartRequest('POST',url);
    final file = await http.MultipartFile.fromPath('fiel', newPictureFiel!.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('Unexpected server error');
      print(resp.body);
      return null;
    }
    this.newPictureFiel = null;
    final decodeData = json.decode(resp.body);
    return decodeData["secure_url"];
  }
}
