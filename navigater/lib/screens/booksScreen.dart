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
      "photo": "assets/images/kitap11.jpg",
      "bookName": "Cesur Yeni Dünya",
      "writer": "Aldous Huxley",
    },
    {
      "photo": "assets/images/kitap12.jpg",
      "bookName": "Bitmeyen Kavga",
      "writer": "John Steinbeck",
    },
  ];

  final List<Map<String, String>> books4 = [
    {
      "photo": "assets/images/kitap13.jpg",
      "bookName": "Harry Potter ",
      "writer": "J.K. Rowling",
    },
    {
      "photo": "assets/images/kitap14.jpg",
      "bookName": "To Kill a Mockingbird",
      "writer": "Harper Lee",
    },
    {
      "photo": "assets/images/kitap15.jpg",
      "bookName": "1984",
      "writer": "George Orwell",
    },
    {
      "photo": "assets/images/kitap16.jpg",
      "bookName": "The Great Gatsby",
      "writer": "F. Scott Fitzgerald",
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

  List<Widget> bookList4() {
    List<Widget> t = [];

    for (var element in books4) {
      t.add(BookList4(
          element["photo"]!, element["bookName"]!, element["writer"]!));
    }

    return t;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed("/users"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/team.svg",
                    height: 20,
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
            onTap: () => Navigator.of(context).pushNamed("/devices"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/device.svg",
                    height: 20,
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
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileItem(
                  avatar: 'assets/images/avatar.jpg',
                  name: "Ceylan Atay",
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
          Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
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

          //2.kutu
          Gap(5),
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
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      //2.text
                      Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Text(
                                    "Favorites",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Gap(5),
                                  Text("\u{2764}"),
                                ],
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
                              child: InkWell(
                                onTap: () =>
                                    Navigator.of(context).pushNamed("/thebook"),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'view all',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey, // arka plan rengi
                              borderRadius: BorderRadius.circular(
                                  10), //köşe yuvarlaklıgi
                            ),
                            padding: EdgeInsets.all(
                                10), // bosluk kbırama
                            child: Text(
                              "Popular Books",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: bookList4(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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

  Widget BookList4(String photo, String title, String artist) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 35.0,
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
                width: 20,
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
