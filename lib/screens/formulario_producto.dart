/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulariologin/models/models.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:provider/provider.dart';
import 'package:formulariologin/providers/product_from_provider.dart';
import 'package:formulariologin/widgets/producto_card.dart';
*//*
class FormularioProducto extends StatelessWidget{
  const FormularioProducto({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 250),
            Text("Formulario del registro de producto"),
            SizedBox(height: 250),
            ChangeNotifierProvider(
                create: (_) => ProductFromProvider(
                    Productos(available: false,
                        name:"",
                        price: 0)),
            child: _FormularioProducto(),)
          ],),
        ),
      )
    );
  }
}
class _FormularioProducto extends StatelessWidget{
  final formularioP = Provider.of<ProductFromProvider>(context);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) => formularioP.product.name = value,
        decoration:  InputDecorations.authInputDecoration(
            hintText: formularioP.name,
            labelText: "Producto"),
        validator: (value) {return (value != null && value.length >= 1) ? null : '';},
      ),
        TextFormField(keyboardType: TextInputType.number,
        onChanged: (value) => formularioP.price = double.parse(value),
        decoration: InputDecorations.authInputDecoration(
            hintText: "Q.",
            labelText: formularioP.product.price),
            validator: (value){String pattern = r'^\d+(,\d{1,2})?$';
          RegExp regex = new RegExp(pattern);
          return regex.hasMatch(value ?? '')?null:'valor incorrecto';},),
        TextFormField(
          onChanged: (value) => formularioP.product.picture = value,
          decoration: InputDecorations.authInputDecoration(
              hintText: "jpeg, jpg, png",
              labelText: formularioP.product.picture),
        ),
        SizedBox(height: 40),
        MaterialButton(color: Colors.deepOrange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            child: Container(child: Text("Registrar", style: TextStyle(color: Colors.black),),
            ),
            onPressed: (){Navigator.pushReplacementNamed(context, "/produc");})
      ],
      ),
    );
  }
}
*/