import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/login_registration_new/Screens/forgot_password.dart';
import 'package:flutter_app/login_registration_new/Services/globals.dart';
import 'package:flutter_app/login_registration_new/Services/auth_services.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
 

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
     var body= jsonDecode(response.body);
      if (response.statusCode == 200) {
       SharedPreferences localStorage= await SharedPreferences.getInstance();
       print(body['token']);
       print(body['user']);
       localStorage.setString('token', body['token']);
       localStorage.setString('user', json.encode(body['user']));
       
       //print(user['id']);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                   prefixIcon:Icon(Icons.email),
                   prefixIconColor: Colors.pinkAccent,
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText:true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                   prefixIcon:Icon(Icons.lock),
                   prefixIconColor: Colors.pinkAccent,
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                btnText: 'LOG IN',
                onBtnPressed: () => loginPressed(), btnColor: Colors.pinkAccent,
              ),
              TextButton(onPressed: (){
                Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const PasswordScreen(),
            ));
              }, child: Text('Forget Password',style: TextStyle(color: Colors.black54,
              decoration: TextDecoration.underline),))
            ],
          ),
        ));
  }
}