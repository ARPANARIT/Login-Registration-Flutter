import 'package:flutter/material.dart';
import 'package:flutter_app/components/EmailFieldWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passToggle=true;
  final loginEmailController=TextEditingController();
    final loginPassController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.green[50],
        shadowColor: Colors.greenAccent,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 10,
        margin: EdgeInsets.all(30),
        child: SizedBox(
          width: 500,
          height: 700,
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
               // key: formfield,
                child: Center(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Login Form',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      

                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      /////////////// New Email validate test //////////////////////////////////
                      EmailFieldWidget(controller:loginEmailController),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: TextFormField(
                          validator: (value) {
                            //if(value.isEmpty) {return "Enter Email";}
                            if (loginPassController.text.length < 6) {
                              return "Password length should be > 6";
                            }
                          },
                          obscureText: passToggle,
                          controller: loginPassController,
                          decoration: InputDecoration(
                            prefixIconColor: Colors.green,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.green,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  
                                });
                              },
                              child: Icon(passToggle
                                  ? (Icons.visibility_off)
                                  : (Icons.visibility)),
                            ),
                            label: Text(
                              'Password',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.green),
                            ),
                            border: myinputborder(),
                            iconColor: Colors.green,
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: SizedBox(
                              width: 125,
                              height: 50,
                              child: ElevatedButton(
                                ///////LOGIN BUTTON///////////////////
                                onPressed: () {},

                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 28),
                                ),
                                style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.white,
                                    elevation: 10,
                                    shadowColor: Colors.green,
                                    primary: Colors.green[900],
                                    shape: StadiumBorder(
                                        side: BorderSide(
                                      width: 2,
                                      color: Color(0xff1b5e20),
                                    ))),
                              ),
                            )),
                      ),
                    ],
                  ),
                )),
              )),
        ),
      ),
    );
    
  }
}
OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
        color:Colors.green,
        width: 3,
      ) 
  );
}

OutlineInputBorder myinputborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color:Colors.green,
        width: 3,
      )
  );
}