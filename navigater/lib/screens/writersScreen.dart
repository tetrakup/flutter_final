//bunu sonradan ekledim
import 'package:flutter/material.dart';
import 'package:navigater/services/responsive.dart';

class writersScreen extends StatefulWidget {
  const writersScreen({super.key});

  @override
  State<writersScreen> createState() => _writersScreenState();
}

class _writersScreenState extends State<writersScreen> {
  Screen device = Screen.mobile;

  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size;//bu bize genişlik ve yükseklik boyutlarını verir.
    //final screenOrientation = MediaQuery.of(context).orientation;//cihazın yatay/dikey durumda old. billisini verir.
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/p1.jpg"),
                radius: 32,
              ),
              Column(
                children: [
                  Text("Arda Emre"),
                ],
              ),
            ],
          ),
        ],
      ),
      drawer: null,
      bottomNavigationBar: null,
    );
  }
}
