import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String  email = '';
  String password = '';
  bool _isLoding = false;
  bool get isLoding => isLoding;
set isLoding(bool value){
  _isLoding = value;
  notifyListeners();
}
  bool isValidForm(){
    print(fromKey.currentState?.validate());
    print('$email - $password');
    return fromKey.currentState?.validate() ?? false;
  }
}