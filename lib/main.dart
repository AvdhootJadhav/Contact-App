import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/contact.dart';
import 'package:hive_demo/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose(){
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Hive.openBox("contacts"),
        builder: (BuildContext context, snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasData){
              return HomePage();
            }
            else{
              return CircularProgressIndicator();
            }
          }
          else return CircularProgressIndicator();
        }
        ),
    );
  }
}
