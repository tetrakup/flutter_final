//sayfalar yüklenirkenki bekleme sayfasi için
import 'package:flutter/material.dart';
import 'package:navigater/core/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  checkLogin() async{
    Storage storage = Storage();

    final user = await storage.loadUser();

    if(user != null){
      Navigator.pushReplacementNamed(context, "/home");

    }
    else{
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),)
    );
  }
}