import 'package:flutter/material.dart';
import 'package:navigater/screens/Category.dart';

import 'screens/device_screen.dart';
import 'screens/homeScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/profileScreen.dart';
import 'screens/registerScreen.dart';
import 'screens/writerScreen.dart';
import 'screens/welcomeScreen.dart';
import 'screens/BooksScreen.dart';
import 'screens/infoScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      routes: {
        '/home': (context) =>const  HomeScreen(),
        '/login': (context) =>const  LoginScreen(),
        '/register': (context) =>const  RegisterScreen(),
        '/profile': (context) =>const  ProfileScreen(),
        '/welcome': (context) =>const  WelcomeScreen(),
        '/writers': (context) => writerScreen(),
        '/anaekran': (context) => BooksScreen(),
        "/Kategoriler":(context)=>const  Kategoriler(),
        "/info": (context) => const InfoScreen(),
        "/device": (context) => const DeviceScreen(),

      },
      initialRoute: '/welcome',
      //initialRoute: '/device',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
  
}

