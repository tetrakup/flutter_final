//sayfalar yüklenirkenki bekleme sayfasi için
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  checkLogin() async{
    SharedPreferences storage = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),)
    );
  }
}