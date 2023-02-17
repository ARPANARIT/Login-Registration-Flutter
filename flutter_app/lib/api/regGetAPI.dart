import 'package:http/http.dart' as http;
import 'dart:convert';
class Api{
  String baseUrl="http://10.0.2.2:8000/api/regtest";
  Future<List> fetch() async{
    try {
      var res= await http.get(Uri.parse(baseUrl));
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
