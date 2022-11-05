import 'package:flutter/material.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
class PreExamen extends StatelessWidget {
  const PreExamen({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PreExamen")),
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 250),
            CardContainer(child:_Card())
          ],),
        ),
      ),
    );
  }
}
class _Card extends StatelessWidget{
  const _Card({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      margin: EdgeInsets.only(top: 40, bottom: 50),
      width: double.infinity,
      height: 500,
      decoration: _cardBorders(),
    ),);
  }
  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
          color: Colors.black12,
          offset: Offset(0,7),
          blurRadius: 10)
    ]
  );
}
class _BaccgroudImage extends StatelessWidget {
  final String? url;
  const _BaccgroudImage(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null ? Image(image: AssetImage(''), fit: BoxFit.cover):
          FadeInImage(
            placeholder: AssetImage(''),
            image: NetworkImage(url!),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}