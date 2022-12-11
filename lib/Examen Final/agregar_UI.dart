import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulariologin/Examen Final/dbo.dart';

class AddStudent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddStudent();
  }
}

class _AddStudent extends State<AddStudent>{

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController price = TextEditingController();
  //test editing controllers for form

  DB mydb = new DB(); //mydb new object from db.dart

  @override
  void initState() {
    mydb.open(); //initilization database
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Producto"),
        ),
        body:Container(
          padding: EdgeInsets.all(30),
          child: Column(children: [
            TextFormField(
              controller: id,
              decoration: InputDecoration(
                hintText: "Id Producto",
              ),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Name Producto",
              ),
            ),

            TextField(
              controller: rollno,
              decoration: InputDecoration(
                hintText: "Roll No.",
              ),
            ),

            TextField(
              controller: price,
              decoration: InputDecoration(
                hintText: "Precio Producto",
              ),
            ),

            ElevatedButton(onPressed: (){

              mydb.db?.rawInsert("INSERT INTO product (id, name, roll_no, price) VALUES (?, ?, ?,?);",
                  [id.text, name.text, rollno.text, price.text]
              ); //add student from form to database

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("New Student Added")));

              id.text = "";
              name.text = "";
              rollno.text = "";
              price.text = "";
              //clear form to empty after adding data

            }, child: Text("Save Products Data")),
          ],),
        )
    );
  }
}