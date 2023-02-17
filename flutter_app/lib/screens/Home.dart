import 'package:flutter/material.dart';
import 'package:flutter_app/screens/lara.dart';


class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
              color: Colors.purple,
              iconSize: 30,
            icon: const Icon(Icons.login),
            tooltip: 'Open Another Details Page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                    return LaraDisplay();
              }));
            },
          ),
          IconButton(
              color: Colors.purple,
              iconSize: 30,
            icon: const Icon(Icons.call_end_rounded),
            tooltip: 'Open Another Details Page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                    return LaraDisplay();
              }));
            },
          ),
      ],),
    );
  }
}