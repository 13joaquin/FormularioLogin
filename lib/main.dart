import 'package:flutter/material.dart';
import 'package:formulariologin/screens/login_screen.dart';
import 'package:formulariologin/screens/home_screen.dart';
import 'package:formulariologin/screens/producto_screen.dart';
import 'package:formulariologin/screens/formulario_producto.dart';
import 'package:formulariologin/screens/card_screens.dart';
import 'package:provider/provider.dart';
import 'package:formulariologin/providers/product_from_provider.dart';
import 'package:formulariologin/models/product.dart';
import 'package:formulariologin/widgets/Proy_Infinite.dart';
import 'package:formulariologin/Examen Final/MyEx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        'login' : (__) => LoginScreen(),
        'home': (__) => HomeScreen(),
        '/produc': (__) => ProductosScreen(),
        /*'Examen' : (__) => FormularioProducto(),*/
        /*'prex': (__) => PreExamen(),*/
        '/IS':(__) =>Infinity(),
        'My': (__) => MyEx(),
      },
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}