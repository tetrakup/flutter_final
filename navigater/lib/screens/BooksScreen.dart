import 'package:flutter/material.dart';

void main() {
  runApp(BooksScreen());
}

class BooksScreen extends StatelessWidget {
  BooksScreen({super.key});

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

    books.forEach((element) {
      t.add(BookList(
          element["photo"]!, element["bookName"]!, element["writer"]!));
    });

  
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

    books3.forEach((element) {
      t.add(BookList3(
          element["photo"]!, element["bookName"]!, element["writer"]!));
    });
  
    return t;

  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
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
                children: [Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(//burada botuna tıklandığında home'a döner.
        onTap: () {
          Navigator.pushNamed(context, '/home'); // Ana menüye dönme işlemi
        },
        child: Row(//burada image ve yazı var.
          children: [
            CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),
          SizedBox(width: 15,),
            /*Image.asset(
              "assets/images/logo.jpg",
              width: 30,
            ),*/
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Books",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27,),),
          ],
        ),
      ),
      Row(
        children: [
          Icon(Icons.book_sharp, color: Colors.greenAccent),
          SizedBox(width: 1,),
          Icon(Icons.edit, color: Colors.greenAccent),
          SizedBox(width: 1,),
         // Icon(Icons.search, color: Colors.white),
          SizedBox(width: 15,),
          /*CircleAvatar(
            radius: 13,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),*/
        ],
      ),
    ],
  ),
),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
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
                            children:
                                bookList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //3.kutu
            Container(
              width: double.infinity,
              height: 60,
              color: const Color.fromRGBO(33, 33, 33, 1),
              child: const Padding(
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
            ),
          ],
        ),
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
