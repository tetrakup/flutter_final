//sayfalar yüklenirkenki bekleme sayfasi için
import 'package:flutter/material.dart';
import 'package:navigater/core/storage.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
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