import 'dart:convert';

import 'package:http/http.dart'as http;

class CallApiReg{
  String url="http://10.0.2.2:8000/api/register";
  postData(dataReg) async{
    return await http.post(Uri.parse(url),
    body: jsonEncode(dataReg),
    headers: setHeaders()
    );

  }
setHeaders()=>{
  'content-type':'application/json',
   'accept':'application/json',

};
  
 String url2="httphttp://10.0.2.2:8000/api/regtest";
 Future<List> getRegister() async{
    try {
      var res= await http.get(Uri.parse(url2));
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