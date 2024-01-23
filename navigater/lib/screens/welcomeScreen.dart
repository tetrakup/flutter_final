import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  /*goToLoginScreen(){
    Navigator.pushNamed(context,'')
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, //ana yön boyutu min.
          children: [
            Text("Welcome to YourBooks"),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Row(
                    children: [
                      Icon(Icons.login_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Login"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.app_registration),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Register"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
