import 'package:flutter/cupertino.dart'; //cupertinoswtich için kütüphane
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; //hafizayi okuma fonk. için kütüphane

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

  List<String> interested = ["Mystery"];

  List<String> allInterested = [
    "Science Fiction",
    "Mystery",
    "Horror",
    "Poetry",
    "Classics",
    "Novel",
    "Non-fiction",
    "Fantasy",
    "Action",
    "General Fiction",
    "Young Adult Fiction",
    "Thriller",
    "Science Fantasy",
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

    if (isActive != null) {
      active = isActive;
    } else {
      active = false;
    }

    if (userFullname != null) {
      fullnameController = TextEditingController(text: userFullname);
    } else {
      fullnameController = TextEditingController(text: "");
    }

    if (userUsername != null) {
      usernameController = TextEditingController(text: userUsername);
    } else {
      usernameController = TextEditingController(text: "");
    }

    if (userEmail != null) {
      emailController = TextEditingController(text: userEmail);
    } else {
      emailController = TextEditingController(text: "");
    }

    if (userPassword != null) {
      passwordController = TextEditingController(text: userPassword);
    } else {
      passwordController = TextEditingController(text: "");
    }

    if (userInterest != null) {
      interested = userInterest;
    } else {
      interested = [];
    }

    setState(() {}); // durum güncelledigimizde setstate kull.
  }

  //hafizaya yaz
  writeStorage() async {
    //asenkron bir işlev kullanabilmek için async. tanimladık.


     //YENİ EKLENEN ÖZELL. BURADA
    var emailRegex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (emailRegex.hasMatch(emailController.text)) {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      
      storage.setBool("active", active);
      storage.setString("fullname", fullnameController.text);
      storage.setString("username", usernameController.text);
      storage.setString("email", emailController.text);// kontrolellerolacak
      storage.setString("password", passwordController.text);
      storage.setStringList("interest", interested);
      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Information Saved Successfully"), //kayıt butonuna basınca ilgili mesajı veren widget
        backgroundColor: Colors.green,
    )); //renk özelliği
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Check your email adres"),
          backgroundColor: Colors.red,
          ),);
    }

  }

  //hafizayi sil
  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    //hepsini siler
    //storage.clear();

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

    setState(() {});
  }

  List<Widget> buildHobbies() {
    List<Widget> result = [];

    allInterested.forEach((element) {
      result.add(
        MyCheckBox(
          title: element,
          value: interested.contains(element),
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
    readStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REGISTER"),
        actions: [
          InkWell(
            onTap: clearStorage,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete),
            ),
          ),
          InkWell(
            //tiklandiginda writestoage fonk. calistiran buton haline geldi
            onTap: writeStorage,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.save),
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
                //apple switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Account Status:"),
                    CupertinoSwitch(
                        value: active, //en guncel degeri burada tutuyor.
                        onChanged: (value) {
                          active = value;
                          setState(
                              () {}); //statefull durum degerleri degistirildiginde durumları güncellemek için
                        }),
                  ],
                ), //apple switch bitis
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Fullname:"),
                    SizedBox(
                      width: 20,
                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Username:"),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller:
                            usernameController, //yazi günceleme yöneticisi
                      ),
                    ) //metni almak içindir fakat expanded içerisinde olmalıdır.
                  ],
                ),
                //mail
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email:"),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller:
                            emailController, //yazi günceleme yöneticisi
                      ),
                    ) //metni almak içindir fakat expanded içerisinde olmalıdır.
                  ],
                ),//mail bitis
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Password:"),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller:
                            passwordController, //yazi günceleme yöneticisi
                      ),
                    ) //metni almak içindir fakat expanded içerisinde olmalıdır.
                  ],
                ),
                
                SizedBox(
                  height: 15,
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
                Text("hobinizi seçin:"),
                SizedBox(
                  height: 15,
                ),
                ...buildHobbies(),
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
