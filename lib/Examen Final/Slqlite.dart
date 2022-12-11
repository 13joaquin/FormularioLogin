import 'dart:js';

import 'package:flutter/material.dart';

class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SqlLite",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: MyHome(title: "SqlTitle Demo",),
    );
  }
}
class MyHome extends StatelessWidget {
  MyHome({Key? key, this.title}) : super(key: key);
   final String title;
   @override
 _MyHome createState() => _MyHome();
}
class _MyHome extends State<MyHome>{
  List<String> _tasks = [];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: <Widget>[for(String task in _tasks) ListTile(title: Text(task),)],
      ), floatingActionButton: FloatingActionButton(
      onPressed: _addTask,
      child: Icon(Icons.add),
    ),
    );
  }
}
_addTask(){
  showDialog(context: context, builder: (context){
    return SimpleDialog(
     children: <Widget>[
       TextField(
           decoration: InputDecoration(icon: Icon(Icons.add_circle_outline)),
         onSubmitted: (text) {
             setState((){_tasks.add(text);
             Navigator.pop(context);})
         },
       )
     ],
    )
  });
}
