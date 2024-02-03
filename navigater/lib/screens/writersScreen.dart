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
      body: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/p1.jpg"),
                  radius: 32,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Arda Emre"),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade400,
                        ),
                        children: [
                          TextSpan(text: ""),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: null,
      bottomNavigationBar: null,
    );
  }
}
