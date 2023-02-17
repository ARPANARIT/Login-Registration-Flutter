import 'package:flutter/material.dart';
import 'package:flutter_app/api/lara.dart';

class LaraDisplay extends StatefulWidget {
  const LaraDisplay({ Key? key }) : super(key: key);

  @override
  State<LaraDisplay> createState() => _LaraDisplayState();
}

class _LaraDisplayState extends State<LaraDisplay> {
  CallApi lara=CallApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        
        leading: IconButton(icon: Icon(Icons.arrow_back,),iconSize: 32,color: Colors.pink,
        splashColor: Colors.pink,
        
        onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: Colors.pink[100],
        elevation: 12,
        shadowColor: Colors.pink[900],
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 10,color: Colors.pink)
        ),
        title: Center(
          child: Text('Lara Data', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 26,color: Colors.pink),),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(
         30,
      ),
      child: Container(
        child:
        FutureBuilder<List>(
        future: lara.getLara(),
        builder: (context, AsyncSnapshot snapshot){
          print(snapshot.data);
          if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        isThreeLine: true,
                        dense: true,
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.pink,
                          child: CircleAvatar(radius:16,
                          backgroundColor: Colors.white,
                          child: Text(snapshot.data![i]['Name'][0],
                          style: TextStyle(fontSize: 24,color: Colors.pink),
                          ),
                        ),
                        ),
                        shape: StadiumBorder(side: BorderSide(color:Colors.pink ,width: 5,),
                        ),
                        //tileColor: Colors.purple[200],
                        title: Text(
                          snapshot.data![i]['Name'],
                          style: TextStyle(fontSize: 30.0),
                        ),
                        subtitle: Text(
                          snapshot.data![i]['Name'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child:SizedBox(width: 100,height: 100,
                  child:  CircularProgressIndicator(color: Colors.purpleAccent,),),
                );
              }
            },
          ),
          
        ),
        
        )
    );
  }
}