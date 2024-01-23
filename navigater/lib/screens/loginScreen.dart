import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email:"),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal:30,vertical: 5),
                decoration: BoxDecoration(
                  color:Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your email address"//YER TUTUCU
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("Password:"),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal:30,vertical: 5),
                decoration: BoxDecoration(
                  color:Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25),),
                  child: TextField(decoration: InputDecoration(
                    hintText: "Please, enter your password"),
                    obscureText: true, // Şifrenin gizli olarak gösterilmesi için
                    ),
                    ),
              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, "/home", (Route<dynamic> route) => false);//pushla üzerine yaz adlandır
                  }
                  , child: Text("Login"),),
                ],
              ),
            ],
          ),
        ),
      ),
      );
  }
}