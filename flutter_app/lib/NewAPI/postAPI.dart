import 'dart:convert';

import 'package:http/http.dart'as http;


class NewApi{
  String url="http://10.0.2.2:8000/api/";
  
  postData(details,endApi) async{
    var fullUrl=url+endApi;
    return await http.post(Uri.parse(fullUrl),
    body: jsonEncode(details),
    headers: setHeaders(),);
  }

  setHeaders()=>{
    'Content-type':'application/json',
    'Accept':'application/json',
  };
}