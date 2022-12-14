import 'package:flutter/material.dart';
import 'package:formulariologin/models/models.dart';
import 'package:formulariologin/ui/input_Decobotton.dart';
class ProductCard extends StatelessWidget {
  final Productos productos;
  const ProductCard({Key? key, required this.productos}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 50),
          width: double.infinity,
          height: 400,
          decoration: _cardBorders(),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _BacagroudImage(productos.picture),
              _ProductDetails(title: productos.name,subtitle: productos.id!),
              Positioned(top: 0, right: 0, child: _PriceTag(productos.price)),
              Container(child: AgregarPorducto()),
              Container(child: ActualizarProducto()),
              Container(child: BorrarProducto()),
              if(!productos.available)
                Positioned(top: 0,right: 0, child: _NotAvailable())
            ],
          ),
        ),);
  }
}
BoxDecoration _cardBorders() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(25),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0,7),
      blurRadius: 10
    )
  ]
);
class _BacagroudImage extends StatelessWidget{
  final String? url;
  const _BacagroudImage(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null ? Image(image: AssetImage('assets/no_image.png'), fit: BoxFit.cover,):
        FadeInImage(placeholder: AssetImage('assets/jar_loaading.git'), image: NetworkImage(url!), fit: BoxFit.cover,),
      ),
    );
  }
}
class _ProductDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  const _ProductDetails({required this.title, required this.subtitle});
  final bool isButtonActive = true;
  late TextEditingController controller;
  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
    })
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buidBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 15,color: Colors.white)
            ),
            ElevatedButton( style: ElevatedButton.styleFrom(onSurface: Colors.blue),
                onPressed: isButtonActive?(){setState(() => isButtonActive = false);}:
                null, child: Text('Boton')),
          ],
        ),
      ),
    );
  }
  BoxDecoration _buidBoxDecoration() => BoxDecoration(
      color: Colors.indigo,
  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topRight: Radius.circular(25))
      );
}
class _PriceTag extends StatelessWidget {
  final double price;
  const _PriceTag(this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('\$$price',
                style: TextStyle(color: Colors.white, fontSize: 20),)
          )
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
      ),
      alignment: Alignment.center,
    );
  }
  }

  class _NotAvailable extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('No disponible', style: TextStyle(color: Colors.white,fontSize: 20)))
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(color: Colors.indigo,borderRadius: BorderRadius.only(
        topRight: Radius.circular(25), bottomLeft: Radius.circular(25)
      )),
    );
  }
  }