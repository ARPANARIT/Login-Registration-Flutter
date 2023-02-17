import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/login_registration_new/Screens/Start.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 var userData;
  @override
  void initState(){
    getUserData();
    super.initState();
  }

  void getUserData() async{
    SharedPreferences localStorage=await SharedPreferences.getInstance();
    var userJson=localStorage.getString('user');
       var user=json.decode(userJson!);
       setState(() {
         
         userData=user;
       });
  } 
  logout(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return StartScreen();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Card(
                      elevation: 10,
                      shadowColor: Colors.grey.shade100,
                      child: SizedBox(
                        width:300,
                        height: 70,
                        child: Padding(padding: EdgeInsets.symmetric(horizontal:10),
                              child: Center(
                                child: Text(userData['name']??'Default User',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:30,
                                fontWeight: FontWeight.w400,
                              ),),
                              )
                      ),
                     ),
                     ),
                     SizedBox(
                      height: 30,
                     ),
                     Card(
                      elevation: 10,
                      shadowColor: Colors.grey.shade100,
                      child: SizedBox(
                        width:300,
                        height: 70,
                        child: Padding(padding: EdgeInsets.symmetric(horizontal:20),
                              child: Center(
                                child: Text(userData['email']??'Default User',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:22,
                                fontWeight: FontWeight.w400,
                              ),),
                              )
                      ),
                     ),
                     
                     ),
                      SizedBox(
                      height: 30,
                     ),
                     RoundedButton(btnText: 'Logout', 
                     onBtnPressed: logout, 
                     btnColor: Colors.black54)
                    ],
                  ),)
          ],),
      ),
    );
  }
}