import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:formulariologin/models/product.dart';
class UserProduct extends ChangeNotifier {
  final _UPROsNAPSHOT = <DocumentSnapshot>[];
  String _erroMenssage = '';
  int documentLimit = 15;
  bool _hasNext = true;
  bool _isFetchingUser = false;

  String get errorMessage => _erroMenssage;
  bool get hasNext => _hasNext;

  Future fetchNextUser() async {
    if(_isFetchingUser) return;
    _erroMenssage = '';
    _isFetchingUser = true;

    _isFetchingUser = false;
  }
}