import 'package:flutter/cupertino.dart';
import 'package:formulariologin/providers/product_from_provider.dart';
import 'package:provider/provider.dart';
import 'package:formulariologin/models/product.dart';
import 'package:formulariologin/widgets/producto_card.dart';
import 'package:formulariologin/providers/producto_provider.dart';
class ListaProductosC extends StatelessWidget{
  final List<Productos> productos =  Provider.of<ProductoProviader>(context).listaproductos ;
  const ListaProductosC({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 500,
      child: ListView.builder(
          itemBuilder: (_, int indexProducto) => ProductCard(productos: productos[indexProducto],),
          scrollDirection: Axis.vertical,
          itemCount: productos.length,),
    );
  }
}