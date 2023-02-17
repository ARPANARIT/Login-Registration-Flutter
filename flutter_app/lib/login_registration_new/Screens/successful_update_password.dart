import 'package:flutter/material.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/login_registration_new/Screens/Start.dart';

class SuccessfulUpdatePassword extends StatefulWidget {
  const SuccessfulUpdatePassword({Key? key}) : super(key: key);

  @override
  State<SuccessfulUpdatePassword> createState() => _SuccessfulUpdatePasswordState();
}

class _SuccessfulUpdatePasswordState extends State<SuccessfulUpdatePassword> {
  

 
  home(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return StartScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Icon(Icons.check_circle_outline_sharp,
                  color: Colors.green,
                  size: 150,),
                ),
                ),
                RoundedButton(btnText: 'Home', onBtnPressed: home, btnColor: Colors.green)
              ],
            ))
          ],
         ),
    );
    
  }
}
