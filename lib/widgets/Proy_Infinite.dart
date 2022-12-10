import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:http/http.dart' as http;
import 'package:formulariologin/models/product.dart';

class Infinity extends StatefulWidget {
Infinity({Key? key}): super(key: key);

@override
  State<Infinity> createState() => _PInfinity();
}

class _PInfinity extends State<Infinity>{
  late ScrollController _scrollController;
  final List<String> _images = [];
  final int _maxLength = 100;
  final _Url = 'https://appmv2-default-rtdb.firebaseio.com/prodctos.json';

  int page = 1;
  bool isLiading = false;
  bool hasMore = true;

  _getList()async {
    setState(() {
      isLiading = true;
    });
    final response = await http.get(Uri.parse(_Url));
    List data = jsonDecode(response.body);
    for (final e in data){
      final _listUrl = e['Nombre']['url'];
      _images.add(_listUrl);
    }
    setState(() {
      isLiading =  false;
      page = page = 1;
      hasMore = _images.length < _maxLength;
    });
    @override
    void iniState(){
      super.initState();
      _getList();
      _scrollController = ScrollController();
      _scrollController.addListener(() {
        if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.95
        && !isLiading){if(hasMore){_getList();}}
      });
    }
    @override
    void dispose(){
      _scrollController.dispose();
      super.dispose();
    }
  }
 @override
 Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[800],
      title: const Text('Infinite Scroll View'),),
      body:  SafeArea(
        child: ListView.separated(
          controller: _scrollController,
            itemBuilder: (context, index) {
              if(index == _images.length){
                return const SizedBox(width: 60,height: 60,child: FittedBox(child: CircularProgressIndicator(),),);
              }
              return Image.network(_images[index],
              height: 300,
              fit: BoxFit.cover,);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: _images.length * (hasMore ? 1 : 0)),
      ),
    );
 }
}