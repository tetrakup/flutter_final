import 'package:flutter/material.dart';
import 'package:navigater/widgets/menuItem.dart';
import 'package:navigater/widgets/profileItem.dart';

class ProfileScreen extends StatelessWidget {
  //const ProfileScreen({super.key});
  final Map<String, dynamic> user;

  ProfileScreen({required this.user});

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
            //id baslangic
            MenuItem(
              icon: Icon(Icons.perm_identity),
              title: "id: ${user["id"]}",
              onTap: () {},
            ),
            Divider(),
            //id bitis
            MenuItem(
              icon: Icon(Icons.person),
              title: "Name: ${user["name"]}",
              onTap: () {},
            ),
            //email ekleme
            MenuItem(
              icon: Icon(Icons.email),
              title: "Email: ${user["email"]}",
              onTap: () {},
            ),
            //email bitis
            Divider(),
            //2.ıtem
            MenuItem(
              icon: Icon(Icons.phone),
              title: "Phone: ${user["phone_number"]}",
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
