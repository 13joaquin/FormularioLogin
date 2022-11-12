import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
export 'package:formulariologin/screens/screens.dart';
import 'package:flutter/widgets.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 250),
            CardContainer(child: _Mennu())
          ],),
        )
        ),
    );
  }
}
class _Mennu extends StatelessWidget{
  const _Mennu({Key? key}):super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Column(children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
              child: MaterialButton(
                color: Colors.grey,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                onPressed: (){Navigator.pushNamed(context, "/produc");},
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text("Producto", textAlign: TextAlign.center, style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w900)),
                  ),
                ),
              ),
              )
            ],
            ),
              Column(children: <Widget>[
                Padding(padding: EdgeInsets.all(10),
                  child: MaterialButton(color: Colors.grey, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onPressed: (){Navigator.pushNamed(context, "card");},
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(child: Text("Card producto", textAlign: TextAlign.center,style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w900), ),),
                  ),),)],
              ),
              Column(children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),
                child: MaterialButton(color: Colors.grey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: (){Navigator.pushNamed(context, "login");},
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text("Cerrar Session", textAlign: TextAlign.center,style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w900),),),
                ),),)
              ],
              ),
              Column(children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),
                child: MaterialButton(color: Colors.grey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: (){Navigator.pushNamed((context), "prex");},
                child: SizedBox(width: 100,height: 100,child: Center(child: Text("PreExamen", textAlign: TextAlign.center,style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w900),),),),),)
              ],),
              Column(children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),
                child: MaterialButton(color: Colors.grey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: (){Navigator.pushNamed((context), "");},
                child: SizedBox(width: 100,height: 100,child: Center(child: Text("Examen Parcial", textAlign: TextAlign.center,style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w900),),),),))
              ],)
            ],
          )
        ],
      ),
    );
  }
}