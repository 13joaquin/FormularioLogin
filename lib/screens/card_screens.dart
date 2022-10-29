import 'package:flutter/material.dart';
import 'package:formulariologin/models/models.dart';
import 'package:formulariologin/widgets/producto_card.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatelessWidget{
  const CardScreen({Key? key, required this.productos}):super(key: key);
final Productos productos;
@override
  Widget build(BuildContext context) {
    return Container(child: ProductCard(productos: productos,));
  }
}