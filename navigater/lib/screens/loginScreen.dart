import 'package:flutter/material.dart';

import '../services/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  showError(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning),
            Gap(12.0),
            Text("Error"),
          ],
        ),
        content: Text("Check your internet connection and try again"),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  loginUser() async {
    setState(() {
      loading = false;
    });
    final API api = API();//api sinifindan bir nesne ürettik.
    
    final result = await api.loginUser(username: emailController.text, password: passwordController.text);
  
  if(result is Exception){
    print(result);
  }
  else{
    print(result);
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email:"),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter your email address" //YER TUTUCU
                      ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Password:"),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: passwordController,

                  decoration:
                      InputDecoration(hintText: "Please, enter your password"),
                  obscureText: true, // Şifrenin gizli olarak gösterilmesi için
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/home",
                          (Route<dynamic> route) =>
                              false); //pushla üzerine yaz adlandır
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
