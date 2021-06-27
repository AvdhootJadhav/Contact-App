import 'package:flutter/material.dart';
import 'package:hive_demo/contact.dart';
import 'package:hive_demo/db.dart';
import 'package:hive_demo/homepage.dart';

class AddContact extends StatelessWidget {
  final name = TextEditingController();
  final number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10.0,right: 10),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter name",
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: number,
              decoration: InputDecoration(
                hintText: "Enter mobile number",
              ),
            ),
            SizedBox(height: 25,),
            ElevatedButton(
              onPressed: (){
                addUser(Contact(name.text, int.parse(number.text)));
                Navigator.pushAndRemoveUntil(context, 
                MaterialPageRoute(builder: (context){
                  return HomePage();
                }), (route) => false);
              }, 
              child: Text("Add")
              )
          ],
        ),
      ),
    );
  }
}