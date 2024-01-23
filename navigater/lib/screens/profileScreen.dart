import 'package:flutter/material.dart';
import 'package:navigater/widgets/menuItem.dart';
import 'package:navigater/widgets/profileItem.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ProfileItem(
              avatar: 'assets/images/avatar.jpg',
              name: "Ceylan Atay",
              /*onTap:() {
                Navigator.pushNamed(context, "/profile");
              },*/
            ),
            Divider(),
            MenuItem(
              icon: Icon(Icons.email),
              title: "Email: ceylan.atay@gmail.com",
              onTap: () {},
            ),
            Divider(),
            //2.ıtem
            MenuItem(
              icon: Icon(Icons.phone),
              title: "Phone: +90 555 000 12 12",
              onTap: () {},
            ),
            Divider(),
            //3.ıtem
            MenuItem(
              icon: Icon(Icons.topic),
              title: "About: Jr. Software Developer",
              onTap: () {},
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
