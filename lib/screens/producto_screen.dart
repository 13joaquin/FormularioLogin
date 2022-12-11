import 'package:flutter/material.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:formulariologin/providers/product_from_provider.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen ({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: new AppBar(title: Text('Productos'),),
     body: AuthBackground(
       child: SingleChildScrollView(
         child: Column(children: [
           SizedBox(height: 250),
           CardContainer(child: Column(children: [
             SizedBox(height: 30),
             ChangeNotifierProvider(create: (__) => ProductFromProvider(),
             child: _ProductosForms(),
             ),
             SizedBox(height: 40),
           ],),)
         ],),
       ),
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     floatingActionButton: FloatingActionButton(
       onPressed: (){},
       child: Icon(Icons.add),
       backgroundColor: Colors.black87,
       foregroundColor: Colors.yellow,
       mini: true,
     ),
     bottomNavigationBar:  BottomAppBar(
       notchMargin: 5.0,
       shape: CircularNotchedRectangle(),
       color: Colors.black87,
       child: Menu(),
     ),
   );
  }
}
class _ProductosForms extends StatelessWidget{
  const _ProductosForms({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final productosForms = Provider.of<ProductFromProvider>(context);
    return Container(
      child: Form(
        key: productosForms.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(keyboardType: TextInputType.number,
          decoration: InputDecorations.authInputDecoration(hintText: "Id", labelText: "ID producto", prefixIcon: Icons.add_circle_outline),
          ),
          SizedBox(height: 30),
          TextFormField(keyboardType: TextInputType.text,
          decoration: InputDecorations.authInputDecoration(hintText: "Nombre Porduto", labelText: "Nombre del Porducto", prefixIcon: Icons.shopping_bag),
          onChanged: (value) => productosForms.name = value,
          validator: (value){
            return (value != null) ? null : 'Campo obligatorio';
          },),
          SizedBox(height: 30),
          TextFormField(keyboardType: TextInputType.number,
          decoration: InputDecorations.authInputDecoration(hintText: "Q.", labelText: "Precio",prefixIcon: Icons.price_check),
          onChanged: (value) => productosForms.name = value,
              validator: (value){return (value != null) ? null : 'Campo obligatorio';
          },),
          SizedBox(height: 30),
          TextFormField(keyboardType: TextInputType.number,
          decoration: InputDecorations.authInputDecoration(hintText: "Cant", labelText: "Cantidad del producto", prefixIcon: Icons.checklist_sharp),
            onChanged: (value) => productosForms.name = value,
              validator: (value){return (value != null) ? null : 'Campo obligatorio';}),
          SizedBox(height: 30,),
          MaterialButton(onPressed: () {Navigator.pushReplacementNamed(context, "routeName");})
        ],),
      ),
    );
  }
}
class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(padding: EdgeInsets.only(left: 10.0),
        child: Column(mainAxisSize: MainAxisSize.min,children: [
          Icon(Icons.home, color: Colors.white,),
          Text("Home", style: TextStyle(color: Colors.white),),
        ],),),
        Padding(padding: EdgeInsets.only(left: 10.0),
        child: Column(mainAxisSize: MainAxisSize.min,children: [
          Icon(Icons.shop, color: Colors.white,),
          Text("Shop", style: TextStyle(color: Colors.white),),
        ],),),
        Padding(padding: EdgeInsets.only(left: 10.0),
        child: Column(mainAxisSize: MainAxisSize.min,children: [
          Icon(Icons.favorite, color: Colors.white,),
          Text("Fav", style: TextStyle(color: Colors.white),)
        ],),),
        Padding(padding: EdgeInsets.only(left: 10.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.settings, color: Colors.white,),
            Text("Config", style: TextStyle(color: Colors.white),)
          ],),)
      ],
    );
  }
}

