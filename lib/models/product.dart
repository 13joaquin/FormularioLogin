// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'dart:convert';

Productos productosFromJson(String str) => Productos.fromJson(json.decode(str));

String productosToJson(Productos data) => json.encode(data.toJson());

class Productos {
  Productos({
    required this.available,
    required this.name,
    this.picture = "",
    required this.price,
    this.id = "",
  });

  bool available;
  String name;
  String picture;
  double price;
  String? id;

factory Productos.fromJson(String str) => Productos.fromMap(json.decode(str));
String toJson() => json.encode(toMap());

  Productos copy() => Productos(
      available: available,
      name: name,
      picture: picture,
      price: price,
      id: id //?? this.id, se quitó porque el programa mostraba un error
  );

  factory Productos.fromMap(Map<String, dynamic> json) => Productos(
    available: json["available"] == null ? null : json["available"],
    name: json["name"] == null ? null : json["name"],
    picture: json["picture"] == null ? null : json["picture"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    id: json["id"] == null ? null : json["id"],);

  //factory Productos.fromJson(Map<String, dynamic> json) => Productos(
    //available: json["available"] == null ? null : json["available"],
    //name: json["name"] == null ? null : json["name"],
    //picture: json["picture"] == null ? null : json["picture"],
    //price: json["price"] == null ? null : json["price"].toDouble(),
    //id: json["id"] == null ? null : json["id"],
  //);

  Map<String, dynamic> toMap() => {
    "available": available == null ? null : available,
    "name": name == null ? null : name,
    "picture": picture == null ? null : picture,
    "price": price == null ? null : price,
    "id": id == null ? null : id,
  };

}