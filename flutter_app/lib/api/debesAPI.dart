
import 'dart:convert';

import 'package:http/http.dart' as http;


class CallApi{
  final String url = 'http://10.0.2.2:8000/api/register';
  
 
  postData(data) async {
    
    return await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }
  

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };
}