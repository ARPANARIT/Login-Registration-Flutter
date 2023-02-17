import 'dart:convert';

import 'package:http/http.dart' as http;

class Login{
  String url='http://10.0.2.2:8000/api/login';
  Future<List> getUsers() async{
    try {
      var res= await http.get(Uri.parse(url));
      if(res.statusCode==200){
          return jsonDecode(res.body);
      }
      else{
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}