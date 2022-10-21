import 'package:flutter/material.dart';
import 'package:formulariologin/screens/screens.dart';
import 'package:formulariologin/screens/producto_screen.dart';

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
        'produc': (__) => ProductoScreen(),
      },
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}