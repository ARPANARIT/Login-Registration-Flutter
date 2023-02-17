import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/RegistrationPage.dart';

class StartScreen2 extends StatefulWidget {
  const StartScreen2({ Key? key }) : super(key: key);

  @override
  State<StartScreen2> createState() => _StartScreen2State();
}

class _StartScreen2State extends State<StartScreen2> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

@override
void initState(){
  super.initState();
  controller=AnimationController(vsync: this,
  duration: Duration(seconds: 1),
  
  )
  ..forward()
  ..repeat(reverse: true);
  animation =Tween(begin: 0.0,end: 1.0).animate(controller);
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Center(
        child:Container(
        width: 300,
        height: 300,
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            size: 150.0,
            color: Colors.indigo[900],
            progress: controller,),
        ),
      ),),
      Center(
        child: Padding(padding: EdgeInsets.only(top: 80),
        child: SizedBox(
          width:200,
          height: 75,
          child: ElevatedButton(
          onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return RegistrationScreen();
                }));
          }, 
        child: Text('Login',style: TextStyle(fontSize: 28),
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
      )

        ],
      ),)
    );
  }
}