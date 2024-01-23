import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Register"),
      ),
      body: Center(child:
      Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Full Name:"),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal:30,vertical: 5),
                decoration: BoxDecoration(
                  color:Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your name "//YER TUTUCU
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("Email:"),
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
              //buradan başlıyor.
              Text("Password:"),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal:30,vertical: 5),
                decoration: BoxDecoration(
                  color:Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25),),
                  child: TextField(decoration: InputDecoration(
                    hintText: "Please, enter a strong password"),
                    obscureText: true, // Şifrenin gizli olarak gösterilmesi için
                    ),
                    ),
                    SizedBox(height:20,),

              //deneme
              /*
              Text("Password:"),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal:30,vertical: 5),
                decoration: BoxDecoration(
                  color:Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(decoration: InputDecoration(hintText: "Please, enter a strong password"),),
              ),
              SizedBox(height:20,),*/
              //deneme
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, "/home", (Route<dynamic> route) => false);//pushla üzerine yaz adlandır
                  }
                  , child: Text("register"),),
                ],
              ),
            ],
          ),
        ),
      ),
      );
  }
}