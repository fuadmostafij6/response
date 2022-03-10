import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class getPackages with ChangeNotifier{
  Map<String, dynamic> _map ={};
  bool _error = false;
  String _errorMessage = "";
  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errrMessege => _errorMessage;

  Future<void> get fetchdata async{

    final res = await get(
      Uri.parse("https://preronaiuddokta.com/api/user/getpackages"),


    );
    if (res.statusCode == 200){
try{
  _map = jsonDecode(res.body);
  _error = false;

}
catch(e){
  _error = true;
  _errorMessage = e.toString();
  _map ={};
}



    }
    else{
      _error = true;
      _errorMessage = "no internet";
      _map ={};


    }
    notifyListeners();
  }

  void initialValues(){
    _error = false;
    _errorMessage = "";
    _map ={};
    notifyListeners();
  }

}