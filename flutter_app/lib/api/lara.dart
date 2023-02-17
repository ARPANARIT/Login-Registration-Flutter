import 'package:http/http.dart' as http;
import 'dart:convert';
class CallApi{
  String baseUrl="http://10.0.2.2/FlutterNLaravel2/laravel/public/test";
  Future<List> getLara() async{
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
