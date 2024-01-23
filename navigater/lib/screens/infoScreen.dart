import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; //hafizayi okuma fonk. için kütüphane

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

 //hafizayi oku 
  readStorage() async { //async:fonksiyonu asenkron hale getirir. (storage:hafizada)
    final SharedPreferences storage = await SharedPreferences.getInstance();

    String? name = storage.getString("fullname");
    String? username = storage.getString("username");
    String? email = storage.getString("email");
    List<String>? interest = storage.getStringList("interest");
  }
  
  //hafizaya yaz
  writeStorage() async{ //asenkron bir işlev kullanabilmek için async. tanimladık.
    final SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString("",true);
    storage.setString("fullname", "value");
    storage.setString("username", "value");
    storage.setString("email", "value@gmail.com");
    storage.setStringList("interest", []);


  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Storage")
      ),
      body: Column(children: [],),
    );
  }
}