import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/login_registration_new/Screens/successful_update_password.dart';
import 'package:flutter_app/login_registration_new/Services/auth_services.dart';
import 'package:flutter_app/login_registration_new/Services/globals.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  final mailController=TextEditingController();
  final resetPasswordController=TextEditingController();
  bool isVisible=false;
  ///////password logic////////////
  setPassword() async{
    var data={
      'email':mailController.text,
      'password':resetPasswordController.text,
    };
    
    if (mailController.text.isNotEmpty && resetPasswordController.text.isNotEmpty){
        var response =await AuthServices.resetPassword(data,'reset');
         Map responseMap = jsonDecode(response.body);
    var body=await json.decode(response.body);
    print(body);
    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return SuccessfulUpdatePassword();
      }));
    }
    else{
       errorSnackBar(context, responseMap.values.first);
    }
    }
    else{ errorSnackBar(context, 'enter all required fields');}
    
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password',style: TextStyle(fontSize: 20),),
        centerTitle: true,

      ),
      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                  child: TextFormField(
                  controller: mailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            mailController.clear();
                          });
                        },
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),),
                  Padding(padding: EdgeInsets.only(top: 50,
                  left: 20,right: 20,),
                  child: TextFormField(
                  obscureText: isVisible,
                    controller: resetPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'Reset Password',
                      hintStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            isVisible=!isVisible;
                          });
                        },
                        child: Icon(isVisible?Icons.visibility_off:Icons.visibility),
                      )
                        
                      
                    ),
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(btnText: 'Submit', onBtnPressed: setPassword, btnColor: Colors.blueGrey)
                ],
              )
            ],
          ))
        ],
      )
    );
  }
}