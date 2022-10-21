import 'package:flutter/material.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:formulariologin/providers/product_from_provider.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:provider/provider.dart';
class ProductoScreen extends StatelessWidget {
  const ProductoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final productoForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 250),
            CardContainer(
              child: Column(children: [
                SizedBox(height: 10),
                Text('Nuevo Producto',
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (__) => ProductFromProvider(),
                    child: _ProductoForm())
              ]),
            ),
            SizedBox(height: 50),
          ]),
        ),
      ),
    );
  }
}
class _ProductoForm extends StatelessWidget {
  const _ProductoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productoForm = Provider.of<ProductFromProvider>(context);
    return Container(
      child: Form(
        key: productoForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Name",
                labelText: "Nombre Producto",
                prefixIcon: Icons.shopping_bag_outlined),
            onChanged: (value) => productoForm.name = value,
            validator: (value) {
              return (value != null) ? null : 'Campo obligatorio';
            },
          ),
          SizedBox(height: 30), //espacio en blanco

          TextFormField(
              obscureText: true,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: "Q. Precio",
                  labelText: "Cantidad de Precio",
                  prefixIcon: Icons.price_change_outlined),
              onChanged: (value) => productoForm.price = value as double,
              validator: (value) {
                return (value != null) ? null : 'Campo obligatorio';
              }),
          SizedBox(height: 30), //espacio en blanco

          TextFormField(
              obscureText: true,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: "Cantidad",
                  labelText: "Cantidad Disponible",
                  prefixIcon: Icons.check_box_outlined),
              onChanged: (value) => productoForm.name = value,
              validator: (value) {
                return (value != null) ? null : 'Campo obligatorio';
              }),
          SizedBox(height: 30),
          TextFormField(
              obscureText: true,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: "Unidad",
                  labelText: "Cantidad en Unidades",
                  prefixIcon: Icons.check_box_outlined),
              onChanged: (value) => productoForm.name = value,
              validator: (value) {
                return (value != null) ? null : 'Campo obligatorio';
              }),
          SizedBox(height: 30),
          TextFormField(
              obscureText: true,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: "Descripcion",
                  labelText: "Descripcion del Producto",
                  prefixIcon: Icons.check_box_outlined),
              onChanged: (value) => productoForm.name = value,
              validator: (value) {
                return (value != null) ? null : 'Campo obligatorio';
              }),
          SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             disabledColor: Colors.grey,
             elevation: 0,
             color: Colors.deepPurple,
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
               child: Text(
                 productoForm.UpdateAvailability(false) ? 'Espere' : 'Insertar',
                 style: TextStyle(color: Colors.white),
               ),
             ),
             onPressed: productoForm.UpdateAvailability(true)
                 ? null
                 : () async {
                     FocusScope.of(context).unfocus();
                     if (productoForm.isValidForm() != null) return;
                     productoForm.UpdateAvailability(true);
                     await Future.delayed(Duration(seconds: 2));

                     productoForm.UpdateAvailability(false);
                     Navigator.pushReplacementNamed(context, "home");     },
           )
        ]
          ),
      ),
    );
  }
}