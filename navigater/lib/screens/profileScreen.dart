import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:navigater/core/storage.dart';
import 'package:navigater/widgets/menuItem.dart';
import 'package:navigater/widgets/profileItem.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  ProfileScreen({required this.user});

  instagram() {
    final Uri uri =
        Uri.parse("https://instagram.com/s.cylnty"); 
    launchUrl(uri);
  }

  linkedin() {
    final Uri uri =
        Uri.parse("https://linkedin.com/in/ceylanatay"); 
    launchUrl(uri);
  }

  call() {
    final Uri uri = Uri.parse("tel:+905554443322"); 
    launchUrl(uri);
  }

  sms() {
    final Uri uri = Uri.parse("sms:+905554443322"); 
    launchUrl(uri);
  }

  mail() {
    final Uri uri = Uri.parse("mailto:fakemail@gmail.com?subject=Support Request&body=Hello, I have a problem with the application.");//yazıyı adrese çevir
    launchUrl(uri);
  }
  whatsapp() {
    final Uri uri = Uri.parse("https://wa.me/+905554443322?text=metin");
    launchUrl(uri);
  }

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
            Row(
              children: [
                InkWell(
                  onTap: call,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      //call
                      "assets/icons/call.svg",
                      height: 30,
                      colorFilter:
                          ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
                    ),
                  ),
                ),
                InkWell(
                  onTap: mail,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      //mail
                      "assets/icons/mail.svg",
                      height: 30,
                      colorFilter:
                          ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
                    ),
                  ),
                ),
                InkWell(
                  onTap: sms,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      //sms
                      "assets/icons/sms.svg",
                      height: 30,
                      colorFilter:
                          ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
                    ),
                  ),
                ),
                InkWell(
                  onTap: instagram,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      //instagram
                      "assets/icons/instagram.svg",
                      height: 30,
                      colorFilter:
                          ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
                    ),
                  ),
                ),
                InkWell(
                  onTap: linkedin,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      //linkedin
                      "assets/icons/linkedin.svg",
                      height: 30,
                      colorFilter:
                          ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
                    ),
                  ),
                ),
                InkWell(
                  onTap: whatsapp,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      //whatsapp
                      "assets/icons/whatsapp.svg",
                      height: 30,
                      colorFilter:
                          ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
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
                ElevatedButton(
                  onPressed: () async {
                    Storage storage = Storage();
                    await storage.clearUser();
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/logout.svg",
                        height: 20,
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
