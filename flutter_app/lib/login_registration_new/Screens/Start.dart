import 'package:flutter/material.dart';

import 'package:flutter_app/login_registration_new/Screens/login_screen.dart';
import 'package:flutter_app/login_registration_new/Screens/register_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  bool isChange = false;
  @override
  initState() {
    super.initState();
    ai_controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  late AnimationController ai_controller;
  @override
  Widget build(BuildContext context) {
    void trigger() {
      setState(() {
        isChange = !isChange;
        isChange ? ai_controller.forward() : ai_controller.reverse();
      });
    }

    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 180),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: IconButton(
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.home_menu,
                        size: 150.0,
                        color: Colors.pinkAccent[400],
                        progress: ai_controller,
                      ),
                      onPressed: trigger,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  textColor: Colors.white,
                  color: Colors.pinkAccent[400],
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>LoginScreen()));
                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
