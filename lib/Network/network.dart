import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class WebServices extends ChangeNotifier {

  String token = "";
  var path = '';



  setPath(value){
    path = value;
    notifyListeners();
  }


  setToken(value){
    token = value;
    notifyListeners();
  }






}


class NetworkError{
  String network;
  NetworkError({required this.network});
}
