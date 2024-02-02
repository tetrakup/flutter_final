import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:navigater/core/storage.dart';
import 'package:navigater/widgets/menuItem.dart';
import 'package:navigater/widgets/profileItem.dart';

//import '../widgets/menuItem.dart';
//import '../widgets/profileItem.dart';
import '../screens/Category.dart';
import 'booksScreen.dart';

int _selectedIndex = 1;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> user = {
    "name": "",
    "id": -1,
    "phone_number": "",
    "email": "",
  };


  //logout error
  logOut() {
    if (kIsWeb) {
      logoutError();
    } else {
      if (Platform.isIOS || Platform.isMacOS) {
        logoutError();
      } else {
        logoutErrorMaterial();
      }
    }
  }
  //

//ios logouterror
  logoutError() async {
    showCupertinoDialog(
      context: context,
      barrierDismissible:
          false, //buton dışında herhangi bi yere tıklanınca kapansın mı kapanmasın mı?
      builder: (context) => CupertinoAlertDialog(
        //dataları silmeden önce sorması için
        title: Row(
          children: [
            Icon(
              Icons.warning,
              color: Colors.teal.shade200,
            ),
            Gap(12.0),
            Text("Confirmation"),
          ],
        ),
        content: Text("Are you sure you want to logout?"),
        actions: [
          CupertinoDialogAction(
            onPressed: () async {
              Storage storage = Storage();
              await storage.clearUser();
              Navigator.of(context).pushReplacementNamed("/login");
            },
            child: Text("Yes"),
            isDestructiveAction: true,
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("No"),
          ),
        ],
      ),
    );
  } //show dialog bitis

//matteral logouterror
  logoutErrorMaterial() async {
    showDialog(
      context: context,
      barrierDismissible:
          false, //buton dışında herhangi bi yere tıklanınca kapansın mı kapanmasın mı?
      builder: (context) => AlertDialog(
        //cikis yapmadan önce sorması için
        title: Row(
          children: [
            Icon(Icons.warning),
            Gap(12.0),
            Text("Confirmation"),
          ],
        ),
        content: Text("Are you sure you want to logout?"),
        actions: [
          ElevatedButton(
              onPressed: () async {
                Storage storage = Storage();
                await storage.clearUser();
                Navigator.of(context).pushReplacementNamed("/login");
              },
              child: Text("Yes")),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("No")),
        ],
      ),
    ); //show dialog bitis
  }

//logout error
  checkLogin() async {
    Storage storage = Storage();

    final user = await storage.loadUser();

    if (user != null) {
      setState(() {
        this.user = user; //this kull. sebebi sinifin user'ı old. belirtmek.
      });
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final List<Widget> _widgetOptions = <Widget>[
    BooksScreen(),
    const Kategoriler(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Home",
              style: TextStyle(
                fontSize: 24, // Yazı boyutu
                color: Color.fromARGB(255, 52, 53, 54), // Metin rengi
                fontWeight: FontWeight.bold, // Kalınlık
                fontStyle: FontStyle.italic, // İtalik stil),
              )),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Name: ${user["name"]}"),
              //     Text("Email: ${user["email"]}"),
              //     Text("Phone: ${user["phone_number"]}"),
              //     Text("id: ${user["id"]}"),
              //   ],
              //   ),
              ProfileItem(
                avatar: 'assets/images/avatar.jpg',
                name: "Ceylan Atay",
                // onTap: () {
                //   Navigator.pushNamed(context, "/profile");
                // },
                onTap: () {
                  Navigator.pushNamed(context, "/profile", arguments: user);
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    const Divider(
                      height: 5,
                    ),
                    MenuItem(
                      title: "Home Screen",
                      icon: const Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.greenAccent,
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, "/anaekran"); //sonradan ekledim
                        _selectedIndex = 0;
                      },
                    ),
                    //2.menuıtem
                    MenuItem(
                      title: "Categories",
                      icon: const Icon(
                        Icons.book_online_outlined,
                        size: 20,
                        color: Colors.greenAccent,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/kategoriler");
                        _selectedIndex = 1;
                      },
                    ),
                    //3.menuitem
                    MenuItem(
                      title: "writers",
                      icon: const Icon(
                        Icons.person_2,
                        size: 20,
                        color: Colors.greenAccent,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/writers");
                      },
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.greenAccent,
                    ),
                    //6.menuitem logout
                    const Divider(),
                    /* ElevatedButton(
                  onPressed: () async{
                    Storage storage = Storage();
                    await storage.clearUser();
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: Text("Logout"),
                ),*/
                    //elevatedbutton deneme baslangic
                    ElevatedButton(
                      onPressed: () async {
                        logoutErrorMaterial();
                        //Storage storage = Storage();
                        //await storage.clearUser();
                        //Navigator.of(context).pushReplacementNamed("/login");
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
                    //elevatedbutton deneme bitis
                  ],
                ),
              ),
              const Text(
                "Version 1.0.2",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}

class Navigation {
  static void push(BuildContext context, MaterialApp materialApp) {}
}
