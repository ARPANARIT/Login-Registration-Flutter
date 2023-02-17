

import 'dart:convert';

import 'package:flutter_app/components/EmailFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_app/NewAPI/postAPI.dart';
import 'package:flutter_app/Pages/WelcomeScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
  
  
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formfield = GlobalKey <FormState>();
 TextEditingController anameController= TextEditingController(); 
 TextEditingController aemailController= TextEditingController(); 
 bool passToggle=true;
 TextEditingController apassController= TextEditingController(); 
  

signin() async{
  var details ={
    'Aname':anameController.text,
    'Aemail':aemailController.text,
    'Apass':apassController.text,
  };
  var res= await NewApi().postData(details,'register');
  var body= json.decode(res.body);
  if(body!['success']){
      Navigator.push(
        context, MaterialPageRoute(builder: (context){
          return WelcomeScreen();
        }));

  }else{
      return Scaffold(
        body: Text('No data'),
      );
    }
}
 void emailValid(){
  bool isEmailValid= !EmailValidator.validate(aemailController.text);
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color:Colors.indigo[50] ,
        shadowColor: Colors.indigoAccent,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 10,
        margin: EdgeInsets.all(30),
        child: SizedBox(
          width:500,
          height: 700,
        child: Padding(padding: EdgeInsets.all(20),
        child: Form(
          key:formfield,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
          children: [
            Center(
              child: Text('Registration Form',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 40,
            ),),),
            Padding(padding: EdgeInsets.only(top: 30),
            child: TextFormField(
              controller:anameController,
              decoration: InputDecoration(
                prefixIconColor: Colors.indigo,
                prefixIcon: Icon(Icons.person,color: Colors.indigo,),
                label: Text('Name',style: TextStyle(fontSize: 30,color: Colors.indigo),),
                 border: myinputborder(),
                iconColor: Colors.indigo,
                focusedBorder: myfocusborder(),
                suffixIcon: IconButton(icon: Icon(Icons.close),
                  onPressed:()=>anameController.clear(),
                )
                ,)
              ),
            ),
            
            Padding(padding: EdgeInsets.only(top: 30),
            
            ),
    /////////////// New Email validate test //////////////////////////////////
            EmailFieldWidget(controller:aemailController),
            Padding(padding: EdgeInsets.only(top: 30),
            child: TextFormField(
              validator: (value){
                //if(value.isEmpty) {return "Enter Email";}
                 if(apassController.text.length<6){ return "Password length should be > 6";}

              },
              obscureText: passToggle,
              controller:apassController,
              decoration: InputDecoration(
                 prefixIconColor: Colors.indigo,
                 prefixIcon: Icon(Icons.lock,color: Colors.indigo,),
                 suffixIcon: InkWell(
                  onTap: (){
                    setState(() {
                      passToggle=!passToggle;
                    });
                  },
                  child: Icon(passToggle?(Icons.visibility_off):(Icons.visibility)),
                 ),
                label: Text('Password',style: TextStyle(fontSize: 30,color: Colors.indigo),),
                 border: myinputborder(),
                iconColor: Colors.indigo,
                focusedBorder: myfocusborder(),
                
              ),
            ),
            ),
            Center(
        child: Padding(padding: EdgeInsets.only(top: 50),
        child: SizedBox(
          width:125,
          height: 50,
          child: ElevatedButton(
            ///////LOGIN BUTTON///////////////////
          onPressed: (){
            final form=formfield.currentState!;
            if(form.validate()){
              signin();
            }
            
              
          },
          
        child: Text('Submit',style: TextStyle(fontSize: 28),
        ),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          elevation: 10,
          shadowColor: Colors.indigo,
          primary: Colors.indigo[900],
          shape: StadiumBorder(side: BorderSide(width: 2,color: Color(0xFF1A237E),))
        ),
        ),
        )
        ),
      ),
      ],
          ),
            )
          ),)
        ),),),);
        
      
      
      
  }
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
        color:Colors.indigo,
        width: 3,
      ) 
  );
}

OutlineInputBorder myinputborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color:Colors.indigo,
        width: 3,
      )
  );
}