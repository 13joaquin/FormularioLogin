import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:formulariologin/providers/login_from_provider.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 250),
            CardContainer(
              child: Column(children: [
                SizedBox(height: 10),
                Text('Login', style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (__) => LoginFormProvider(), child: _LoginForm())
              ]),
            ),
            SizedBox(height: 50),
            Text(
              'Crear una cuenta nueva',
              style: TextStyle(fontSize: 45),
            )
          ]),
        ),
      ),
    );
  }
}
class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.fromKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: "juaquinRa@gmail.com",
                  labelText: "Email",
                  prefixIcon: Icons.add_photo_alternate_sharp),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = new RegExp(pattern);
                return regex.hasMatch(value ?? '')? null : 'El valor no es email valido';
              }),
          SizedBox(height: 30),
          TextFormField(
              obscureText: true,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: "********",
                  labelText: "Contraseña",
                  prefixIcon: Icons.password_outlined),
              onChanged: (value) => loginForm.password = value,
              validator: (value){
                return (value != null && value.length >= 6)? null : 'La contraseña debe tener al menor 6 caracters';
              },),
          SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoding ? 'Espere': 'Ingresar',
                style: TextStyle(color: Colors.white),
              )
            ),
            onPressed: loginForm.isLoding ? null : () async{
              FocusScope.of(context).unfocus();
              if(!loginForm.isValidForm()) return;
              loginForm.isLoding = true;
              await Future.delayed(Duration(seconds: 2));
              loginForm.isLoding = false;
              Navigator.pushReplacementNamed(context, "home");
            },
          )
        ]),
      ),
    );
  }
}