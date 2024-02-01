import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:navigater/core/storage.dart';
import 'package:navigater/widgets/menuItem.dart';
import 'package:navigater/widgets/profileItem.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    final user =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(5),
                ProfileItem(
                  avatar: 'assets/images/avatar.jpg',
                  name: "Ceylan Atay",
                ),
              ],
            ),
            Gap(8),
            MenuItem(
              icon: Icon(Icons.perm_identity),
              title: "id: ${user["id"]}",
              onTap: () {},
            ),
            Divider(),
            MenuItem(
              icon: Icon(Icons.person),
              title: "Name: ${user["name"]}",
              onTap: () {},
            ),
            MenuItem(
              icon: Icon(Icons.email),
              title: "Email: ${user["email"]}",
              onTap: () {},
            ),
            Divider(),
            MenuItem(
              icon: Icon(Icons.phone),
              title: "Phone: ${user["phone_number"]}",
              onTap: () {},
            ),
            Divider(),
            MenuItem(
              icon: Icon(Icons.topic),
              title: "About: Jr. Software Developer",
              onTap: () {},
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Go back"),
                ),
                Gap(10),
                /*ElevatedButton(
                  onPressed: () async{
                    Storage storage = Storage();
                    await storage.clearUser();
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: Text("Logout"),
                ),*/
                ElevatedButton(
                          onPressed:() async {
                            Storage storage = Storage();
                    await storage.clearUser();
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/logout.svg",
                                height: 30,
                                colorFilter: ColorFilter.mode(
                                  Colors.white60,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Logout"),
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
