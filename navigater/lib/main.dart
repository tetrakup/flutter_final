import 'package:flutter/material.dart';
import 'package:navigater/screens/Category.dart';
import 'package:navigater/screens/loadingScreen.dart';
import 'package:navigater/screens/onboardingScreen.dart';

import 'screens/device_screen.dart';
import 'screens/homeScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/profileScreen.dart';
//import 'screens/registerScreen.dart';
import 'screens/registerScreen.dart';
import 'screens/users_screen.dart';
import 'screens/writerScreen.dart';
import 'screens/booksScreen.dart';
import 'screens/bookScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      //theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,

      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const InfoScreen(),
        '/profile': (context) => ProfileScreen(
              user: const {},
            ),
        '/anaekran': (context) => BooksScreen(),
        "/kategoriler": (context) => const Kategoriler(),
        "/device": (context) => const DeviceScreen(),
        "/users": (context) => const UsersScreen(),
        "/devices": (context) => const DeviceScreen(),
        "/loading": (context) => const loadingScreen(),
        "/writers": (context) => PostListPage(),
        "/thebook": (context) => BookScreen(),
        "/start": (context) => OnBoardingScreen(),

      },
      //  "/info": (context) => const InfoScreen(),
      initialRoute: '/start',

     // initialRoute: '/loading',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
