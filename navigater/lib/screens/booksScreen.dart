import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:navigater/widgets/profileItem.dart';
//flutter svg desteklemediği için svg. destk. lib.

void main() {
  runApp(BooksScreen());
}

class BooksScreen extends StatelessWidget {
  BooksScreen({super.key});

    Map<String, dynamic> user = {
    "name": "",
    "id": -1,
    "phone_number": "",
    "email": "",
  };

  final List<Map<String, String>> books = [
    {
      "photo": "assets/images/kitap1.jpg",
      "bookName": "Yaratmayan İns..",
      "writer": "Erich Fromm",
    },
    {
      "photo": "assets/images/kitap2.jpg",
      "bookName": "İnsanca, Pek İns",
      "writer": "Irvin D. Yalom",
    },
    {
      "photo": "assets/images/kitap3.jpg",
      "bookName": "Nietzsche Ağlad",
      "writer": "Yazar İsmi",
    },
    {
      "photo": "assets/images/kitap4.jpg",
      "bookName": "İnsan Ne ile Yaş",
      "writer": "Lev Tolstoy",
    },
  ];
  final List<Map<String, String>> books2 = [
    {
      "photo": "assets/images/kitap5.jpg",
      "bookName": "Tutunamayanlar",
      "writer": "Oğuz Atay",
    },
    {
      "photo": "assets/images/kitap6.jpg",
      "bookName": "Aldatma Sanatı",
      "writer": "Kevin D. Mitnick",
    },
    {
      "photo": "assets/images/kitap7.jpg",
      "bookName": "Huzursuzluğun K",
      "writer": "Fernando Pessoa",
    },
    {
      "photo": "assets/images/kitap8.jpg",
      "bookName": "Beyaz Zambaklar",
      "writer": "Grigoriy Petrov",
    },
  ];

  final List<Map<String, String>> books3 = [
    {
      "photo": "assets/images/kitap9.jpg",
      "bookName": "Outliers  ",
      "writer": "Malcolm Gladwell",
    },
    {
      "photo": "assets/images/kitap10.jpg",
      "bookName": "Fareler ve İnsan",
      "writer": "John Steinbeck",
    },
    {
      "photo": "assets/images/kitap9.jpg",
      "bookName": "Outliers  ",
      "writer": "Malcolm Gladwell",
    },
    {
      "photo": "assets/images/kitap10.jpg",
      "bookName": "Fareler ve İnsan",
      "writer": "John Steinbeck",
    },
  ];

  List<Widget> bookList() {
    List<Widget> t = [];

    for (var element in books) {
      t.add(BookList(
          element["photo"]!, element["bookName"]!, element["writer"]!));
    }

    return t;
  }

  List<Widget> bookList2() {
    List<Widget> t = [];

    books2.forEach((element) {
      t.add(BookList2(
          element["photo"]!, element["bookName"]!, element["writer"]!));
    });

    return t;
  }

  List<Widget> bookList3() {
    List<Widget> t = [];

    for (var element in books3) {
      t.add(BookList3(
          element["photo"]!, element["bookName"]!, element["writer"]!));
    }

    return t;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                       // logoutErrorMaterial();
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
        
      body: Column(
        children: [
          //1.kutu
          Container(
            width: double.infinity,
            height: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(62, 36, 17, 1),
                  Color.fromRGBO(48, 14, 24, 1),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        //burada botuna tıklandığında home'a döner.
                        onTap: () {
                          //Navigator.pushNamed( context, '/home'); // Ana menüye dönme işlemi
                          Scaffold.of(context).openDrawer();
                        },
                        child: const Row(
                          //burada image ve yazı var.
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  AssetImage("assets/images/avatar.jpg"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Books",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamed("/users"),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/team.svg",
                                    height: 30,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.blueGrey, BlendMode.srcIn),
                                  ),
                                  const Text(
                                    'Readers',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //device start
                          InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamed("/devices"),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/device.svg",
                                    height: 25,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.blueGrey, BlendMode.srcIn),
                                  ),
                                  const Text(
                                    'System Information',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //device finish
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryItem("Science Fiction"),
                      CategoryItem("Mystery"),
                      CategoryItem("Horror"),
                      CategoryItem("Poetry"),
                      CategoryItem("Classics"),
                      CategoryItem("Novel"),
                      CategoryItem("Non-fiction"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //2.kutu
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color.fromRGBO(7, 5, 8, 8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "start reading now",
                        style: TextStyle(
                          color: Color.fromARGB(255, 187, 186, 186),
                          fontSize: 12,
                        ),
                      ),
                      //2.text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Favorites",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 3.0,
                                bottom: 5,
                                right: 9,
                                left: 9), //burası
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Text(
                              "see all",
                              style: TextStyle(
                                color: Color.fromARGB(255, 187, 186, 186),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              // width: - 10, TEKRAR BAKACAĞIM
                              child: Column(
                                children: bookList(),
                              ),
                            ),
                            Column(
                              children: bookList2(),
                            ),
                            Column(children: bookList3()),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Popular Books",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 3.0,
                                bottom: 3,
                                right: 9,
                                left: 9), //burası
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Text(
                              "see all",
                              style: TextStyle(
                                color: Color.fromARGB(255, 187, 186, 186),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: bookList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //3.kutu
          /*Container(
              width: double.infinity,
              height: 60,
              color: const Color.fromRGBO(33, 33, 33, 1),
              child: const 
               Padding(
                padding: EdgeInsets.all(8.0),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    //2.column
                    Column(
                      children: [
                        Icon(
                          Icons.check_box,
                          color: Colors.white,
                        ),
                        Text(
                          "Completed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    //3.colum
                    Column(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Text(
                          "Explorer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    //4.column
                    Column(
                      children: [
                        Icon(
                          Icons.view_cozy,
                          color: Colors.white,
                        ),
                        Text(
                          "Library",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    //5.colmn
                    Column(
                      children: [
                        Icon(
                          Icons.download_done,
                          color: Colors.white,
                        ),
                        Text(
                          "Download",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),*/
        ],
      ),
    );
  }

  Padding MusicRow2(String photo, String title, String artist) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset(
                photo,
                width: 150,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                artist,
                style: const TextStyle(
                  color: Color.fromARGB(255, 181, 181, 181),
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget BookList(String photo, String title, String artist) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                photo,
                width: 70,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    artist,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 181, 181),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget BookList2(String photo, String title, String artist) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                photo,
                width: 70,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    artist,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 181, 181),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BookList3(String photo, String title, String artist) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                photo,
                width: 70,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    artist,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 181, 181),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Container CategoryItem(
    String text,
  ) {
    return Container(
      padding:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 12, right: 12),
      margin: const EdgeInsets.only(left: 3, right: 3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(33, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(20, 255, 255, 255),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
