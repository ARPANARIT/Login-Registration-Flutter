import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png',),
          fit: BoxFit.cover,
       ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Card(
           
            child: SizedBox(
              width: 300,
              height: 500,
            
              child: Container(
                decoration: BoxDecoration(
                 color: Colors.black54,
                ),
                
                child: Opacity(opacity: 0.7,
                child: Image(
                  image: AssetImage('assets/login.png'),
                  fit: BoxFit.cover,
                ),),
              ),
              ),
              
          ), 
          
          
          ),
          ),
      );
    
  }
}