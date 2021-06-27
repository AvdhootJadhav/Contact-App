import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/addcontact.dart';
import 'package:hive_demo/contact.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var box = Hive.box('contacts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact App"),
        
      ),
      body: WatchBoxBuilder(
        box: box, 
        builder: (context,contacts){
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context,index){
              final contacts = box.getAt(index) as Contact;
              return Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: Card(
                  child: ListTile(
                    title: Text(contacts.name),
                    subtitle: Text(contacts.number.toString()),
                    trailing: IconButton(
                      onPressed: (){
                        box.deleteAt(index);
                      }, 
                      icon: Icon(Icons.delete))
                  ),
                ),
              );
            }
            );
        }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddContact()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}