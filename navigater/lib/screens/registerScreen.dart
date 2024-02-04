import 'package:flutter/cupertino.dart'; //cupertinoswtich için kütüphane
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart'; //hafizayi okuma fonk. için kütüphane
import 'dart:io'
    show
        Platform; //Flutter'ın hng plotformda olduğumuzu göstermek için yazd. bir kütüphane

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
//durum widget'ı
  bool active = false; //sonradan tanimlayacağiz
//  String fullname = ""; >controller tanimladigimiz için bunlara gerek kalmadi
  TextEditingController fullnameController = TextEditingController();
//  String username = "";>controller tanimladigimiz için bunlara gerek kalmadi
  TextEditingController usernameController = TextEditingController();
  //String email = "";
  TextEditingController emailController = TextEditingController();
  //password ekleecegiz
  TextEditingController passwordController = TextEditingController();

  List<String> interested = [];

  List<String> allInterested = [
    "Science Fiction",
    "Mystery",
    "Horror",
    "Poetry",
    "Classics",
    "Novel",
    "Non-fiction",
    "Fantastic",
    "Action",
    "General Fiction",
    "Young Adult Fiction",
    "Thriller",
    "Science Fantastic",
    "Short Story",
    "Adventure",
    "Humor",
    "Paranormal",
    "Random",
    "Romance",
    "Spiritual",
    "Historical Fiction",
    "Vampire",
    "Philosophy"
  ];

//storeData ekleme denemesi
  // storeData() async {
  //       final SharedPreferences storage = await SharedPreferences.getInstance();

  //       storage.  }

  //hafizayi oku
  readStorage() async {
    //async:fonksiyonu asenkron hale getirir. (storage:hafizada)
    final SharedPreferences storage = await SharedPreferences.getInstance();
    bool? isActive = storage.getBool("active");
    String? userFullname = storage.getString("fullname");
    String? userUsername = storage.getString("username");
    String? userEmail = storage.getString("email");
    String? userPassword = storage.getString("password");

    List<String>? userInterest = storage.getStringList("interest");

    setState(() {
      // if (isActive != null) {
      //   active = isActive;
      // } else {
      //   active = false;
      // }
      active = (isActive != null) ? isActive : false;

      // if (userFullname != null) {
      //   fullnameController = TextEditingController(text: userFullname);
      // } else {
      //   fullnameController = TextEditingController(text: "");
      // }
      fullnameController = TextEditingController(text: userFullname ?? "");

      // if (userUsername != null) {
      //   usernameController = TextEditingController(text: userUsername);
      // } else {
      //   usernameController = TextEditingController(text: "");
      // }
      usernameController = TextEditingController(text: userUsername ?? "");

      // if (userEmail != null) {
      //   emailController = TextEditingController(text: userEmail);
      // } else {
      //   emailController = TextEditingController(text: "");
      // }
      emailController = TextEditingController(text: userEmail ?? "");

      // if (userPassword != null) {
      //   passwordController = TextEditingController(text: userPassword);
      // } else {
      //   passwordController = TextEditingController(text: "");
      // }
      passwordController = TextEditingController(text: userPassword ?? "");

      // if (userInterest != null) {
      //   interested = userInterest;
      // } else {
      //   interested = [];
      // }
      interested = (userInterest != null) ? userInterest : [];
    }); // durum güncelledigimizde setstate kull.
  }

  //hafizaya yaz
  writeStorage() async {
    //asenkron bir işlev kullanabilmek için async. tanimladık.

    //YENİ EKLENEN ÖZELL. BURADA
    var emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (emailRegex.hasMatch(emailController.text)) {
      final SharedPreferences storage = await SharedPreferences.getInstance();

      storage.setBool("active", active);
      storage.setString("fullname", fullnameController.text);
      storage.setString("username", usernameController.text);
      storage.setString("email", emailController.text); // kontrolellerolacak
      storage.setString("password", passwordController.text);
      storage.setStringList("interest", interested);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Information Saved Successfully"), //kayıt butonuna basınca ilgili mesajı veren widget
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Go to Login', // Butonun üzerinde görünecek metin
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/login", (Route<dynamic> route) => false);
          },
        ),
      )); //renk özelliği
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Check your email adres"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  //silme işlem arayüzü için cihazı kontrol et
  clearData() {
    if (kIsWeb) {
      clearStorageIOS();
    } else {
      if (Platform.isIOS || Platform.isMacOS) {
        clearStorageIOS();
      } else {
        clearStorageMaterial();
      }
    }
  }

  //IOS ıcın hafızayı sil
  clearStorageIOS() async {
    await showCupertinoDialog(
      context: context,
      barrierDismissible:
          true, //buton dışında herhangi bi yere tıklanınca kapansın mı kapanmasın mı?
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
        content: Text("Are you sure you want to clear all the data?"),
        actions: [
          CupertinoDialogAction(
            onPressed: () async {
              final SharedPreferences storage =
                  await SharedPreferences.getInstance();
              //seçili olanı temizler
              storage.remove("active");
              storage.remove("fullname");
              storage.remove("username");
              storage.remove("email");
              storage.remove("password");
              storage.remove("interest");
              usernameController.text = "";
              fullnameController.text = "";
              active = false;
              emailController.text = "";
              passwordController.text = "";
              interested = [];
              Navigator.of(context).pop(); // showDialog kapatma
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
    ); //show dialog bitis
    setState(() {});
  }

  //hafizayi sil
  clearStorageMaterial() async {
    showDialog(
      context: context,
      barrierDismissible:
          false, //buton dışında herhangi bi yere tıklanınca kapansın mı kapanmasın mı?
      builder: (context) => AlertDialog(
        //dataları silmeden önce sorması için
        title: Row(
          children: [
            Icon(Icons.warning),
            Gap(12.0),
            Text("Confirmation"),
          ],
        ),
        content: Text("Are you sure you want to clear all the data?"),
        actions: [
          ElevatedButton(
              onPressed: () async {
                final SharedPreferences storage =
                    await SharedPreferences.getInstance();
                //seçili olanı temizler
                storage.remove("active");
                storage.remove("fullname");
                storage.remove("username");
                storage.remove("email");
                storage.remove("password");
                storage.remove("interest");
                usernameController.text = "";
                fullnameController.text = "";
                active = false;
                emailController.text = "";
                passwordController.text = "";
                interested = [];
              },
              child: Text("Yes")),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("No")),
        ],
      ),
    ); //show dialog bitis
    //hepsini siler
    //storage.clear();
    setState(() {});
  }

  List<Widget> buildHobbies() {
    List<Widget> result = [];

    allInterested.forEach((element) {
      result.add(
        MyCheckBox(
          title: element,
          value: interested
              .contains(element), //contains:içeriyor mu diye kontrol eder
          onChanged: (value) {
            if (value == true) {
              interested.add(element);
            } else {
              interested.remove(element);
            }
            setState(() {});
          },
        ),
      );
    });
    return result;
  }

  @override
  void initState() {
    //guncellemeleri kendi getirir herhangib ir butona basmamız gerekmez.
    readStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REGISTER"),
        actions: [
          //
          InkWell(
            onTap: () => Navigator.of(context).pushNamed("/login"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/turnleft.svg",
                    height: 15,
                    colorFilter:
                        ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: clearStorageMaterial,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
          Gap(5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  //tiklandiginda writestoage fonk. calistiran buton haline geldi
                  onTap: writeStorage,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.save),
                  ),
                ),
              ],
            ),
          ),
        ], //AppBar'ın bir özelliği. aksiyon-liste
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/register.svg",
                        height: 130,
                        colorFilter: ColorFilter.mode(
                          Colors.blueGrey,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Account Status:"),
                      Switch(
                          value: active, //en guncel degeri burada tutuyor.
                          onChanged: (value) {
                            active = value;
                            setState(
                                () {}); //statefull durum degerleri degistirildiginde durumları güncellemek için
                          }),
                    ],
                  ),
                ),
                Gap(8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fullname:"),
                      Gap(20),
                      //SizedBox(width: 20,),
                      Expanded(
                        child: TextField(
                          controller: fullnameController,
                          /*onChanged: (value){
                          fullname = value;
                          setState(() {});//statefull durum
                        },*/
                        ),
                      ) //metni almak içindir fakat expanded içerisinde olmalıdır.
                    ],
                  ),
                ),
                Gap(8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Username:"),
                      Gap(20),
                      //SizedBox(width: 20,),
                      Expanded(
                        child: TextField(
                          controller:
                              usernameController, //yazi günceleme yöneticisi
                        ),
                      ) //metni almak içindir fakat expanded içerisinde olmalıdır.
                    ],
                  ),
                ),
                Gap(8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    //mail
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email:"),
                      SizedBox(
                        width: 20,
                      ),
                      Gap(20),
                      Expanded(
                        child: TextField(
                          controller:
                              emailController, //yazi günceleme yöneticisi
                        ),
                      ) //metni almak içindir fakat expanded içerisinde olmalıdır.
                    ],
                  ),
                ), //mail bitis
                Gap(8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Password:"),
                      Gap(20),
                      //SizedBox(width: 20,),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller:
                              passwordController, //yazi günceleme yöneticisi
                        ),
                      ) //metni almak içindir fakat expanded içerisinde olmalıdır.
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
                Text("Select Your Interest"),
                SizedBox(
                  height: 15,
                ),

                ...buildHobbies(), //üç nokta köşeliparantezi görmezden gelir.
                //ElevatedButton( onPressed: readStorage, child: Text("Read"),),
                //ElevatedButton(onPressed: writeStorage, child: Text("Saved"),),
                //ElevatedButton(onPressed: clearStorage, child: Text("Clear"),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCheckBox extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?)? onChanged;

  const MyCheckBox({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Checkbox(value: value, onChanged: onChanged),
        )
      ],
    );
  }
}
