import 'package:flutter/material.dart';

import '../widgets/menuItem.dart';
import '../widgets/profileItem.dart';
import '../screens/Category.dart';
import '../screens/BooksScreen.dart';


int _selectedIndex = 0;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
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
        //title: Text("1K") ,
        title: Text(
  "Home",style: TextStyle(
    fontSize: 24, // Yazı boyutu
    color:  Color.fromARGB(255, 52, 53, 54), // Metin rengi
    fontWeight: FontWeight.bold, // Kalınlık
    fontStyle: FontStyle.italic, // İtalik stil),
)
      ),),
      drawer: Drawer(
        child: Column(
          children: [
            ProfileItem(
              avatar: 'assets/images/avatar.jpg',
              name: "Ceylan Atay",
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              },
            ),
            Expanded(
              child: Column(
                children: [
                  Divider(
                    height: 5,
                  ),
                  MenuItem(
                    title: "Home Screen",
                    icon:const Icon(
                      Icons.home,
                      size: 20,
                      color: Colors.greenAccent,
                    ),
                    onTap: () { Navigator.pushNamed(context, "/anaekran");//sonradan ekledim  
                 _selectedIndex=0;
                 
                    },
                  ),
                  //2.menuıtem
                  MenuItem(
                    title: "Categories",
                    icon:const Icon(
                      Icons.book_online_outlined,
                      size: 20,
                      color: Colors.greenAccent,
                    ),
                    onTap: () {Navigator.pushNamed(context, "/Kategoriler");_selectedIndex=1;},
                  ),
                  //3.menuitem n Divider
                  Divider(
                    height: 5,
                    color: Colors.greenAccent,
                  ),
                  MenuItem(
                    title: "writers",
                    icon: Icon(
                      Icons.person_2,
                      size: 20,
                      color: Colors.greenAccent,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/writers");
                    },
                  ),
                  //6.menuitem logout
                  Divider(),
                  MenuItem(
                   icon: Icon(
                      Icons.logout_outlined,
                      size: 20,
                      color: Colors.greenAccent,
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/welcome', (route) => false);
                    },
                   title: "Logout",//burada
                   ),
                ],
              ),
            ),
            Text(
              "Version 1.0.2",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
        body: _widgetOptions.elementAt(_selectedIndex));
        
  }
 
}

class Navigation {
  static void push(BuildContext context, MaterialApp materialApp) {}
}
