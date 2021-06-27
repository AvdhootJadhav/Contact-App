import 'package:hive_demo/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

addUser(Contact contact){
  var box = Hive.box("contacts");
  box.add(contact);
}