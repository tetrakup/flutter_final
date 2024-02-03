import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:navigater/core/storage.dart';
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
              Gap(5),
              Expanded(
                child: Column(
                  children: [
                    const Divider(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/writ3rs');
                        Navigator.pushNamed(context, '/anaekran');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/home.svg",
                            height: 30,
                            colorFilter: ColorFilter.mode(
                              Colors.white60,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Home Screen"),
                        ],
                      ),
                    ),
                    Gap(5),
                    //daha sonra sileceğim writersbuton
                    //2.menuıtem
                    /* MenuItem(
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
                    ),*/
                    //daha sonra sileceğim writersbuton
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/writ3rs');
                        Navigator.pushNamed(context, '/kategoriler');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/categories.svg",
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              Colors.white60,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Categories"),
                        ],
                      ),
                    ),
                    Gap(5),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/writ3rs');
                        Navigator.pushNamed(context, '/writers');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/writer.svg",
                            height: 30,
                            colorFilter: ColorFilter.mode(
                              Colors.white60,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Writers"),
                        ],
                      ),
                    ),
                    Gap(5),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/thebook');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/book.svg",
                            height: 30,
                            colorFilter: ColorFilter.mode(
                              Colors.white60,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Books"),
                        ],
                      ),
                    ),
                    //books
                    //6.menuitem logout
                    const Divider(),
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
