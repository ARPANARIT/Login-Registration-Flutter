import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_app/api/registerAPI.dart';
import 'package:flutter_app/screens/registerDisplay.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController=TextEditingController();
    TextEditingController emailController=TextEditingController();
  
  register() async{
     var dataReg={
    'name':nameController.text,
    'email':emailController.text,};
    var res=await CallApiReg().postData(dataReg);
    var body=json.decode(res.body);
    if(body['success']){
      Navigator.push(
        context, MaterialPageRoute(builder: (context){
          return Scaffold(
            appBar: AppBar(actions: [
              IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return RegisterDisplay();
                }));
              }, icon: Icon(Icons.menu_book,size: 30,color: Colors.black,))
            ],
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text('Go Back',style: TextStyle(fontSize: 30,color: Colors.black),),
            leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,),onPressed:(){ Navigator.pop(context);}),),
          );
        })
      );
    }
    else{
      return Scaffold(
        body: Text('No data'),
      );
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Text('LOGIN',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey
        ),),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.teal,),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.teal,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.teal,),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.teal,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)
                      ),
                    ),
                  ),
                ),

                Padding(padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  child:Text('SUBMIT'),
                  onPressed: register,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: StadiumBorder(
                    )
                  ),
                ),


                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}