import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgregarPorducto extends StatelessWidget {
  const AgregarPorducto({Key? key}):super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        MaterialButton(color: Colors.deepPurple,
            onPressed: (){Navigator.pushNamed(context, "");},
        child: SizedBox(height: 20, child: Center(
          child:Icon(Icons.add_circle)
        ),),)
      ],),
    );
  }
}
class ActualizarProducto extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        MaterialButton(color: Colors.lightBlue, onPressed: (){Navigator.pushNamed(context, "editar");},
        child: SizedBox(height: 20, child: Center(
          child: Icon(CupertinoIcons.arrow_counterclockwise),
        ),),)
      ],),
    );
  }
}
class BorrarProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: [MaterialButton( color: Colors.red,
          onPressed: (){ showDialog(context: context, builder: (context) => AlertDialog(
            title: Text("ALERT"),
            content: Text("Quiere eliminar"),
            actions: <Widget>[MaterialButton(onPressed: (){Navigator.of(context).pop("No");}, child: Text("No")),
            MaterialButton(onPressed: (){Navigator.of(context).pop("Si");}, child: Text('Si'),)],
          ));
        Navigator.pushNamed(context, "borrar");},
      child: SizedBox(height: 20, child: Center(
        child: Icon(CupertinoIcons.delete),
      ),),)],
    ),);
  }
}