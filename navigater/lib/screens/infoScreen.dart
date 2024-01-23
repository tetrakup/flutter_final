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
  String email = "";
  List<String> interested = [];





 //hafizayi oku 
  readStorage() async { //async:fonksiyonu asenkron hale getirir. (storage:hafizada)
    final SharedPreferences storage = await SharedPreferences.getInstance();
    bool? isActive = storage.getBool("active");
    String? userFullname = storage.getString("fullname");
    String? userUsername = storage.getString("username");
    String? userEmail = storage.getString("email");
    List<String>? userInterest = storage.getStringList("interest");

    /*print(isActive);
    print(userFullname);
    print(userUsername);
    print(userEmail);
    print(userInterest);*/
    if (isActive !=null){ active = isActive;}
    else { active = false;}

    if (userFullname !=null){ fullnameController = TextEditingController(text: userFullname);}
    else { fullnameController = TextEditingController(text: "");}

    if (userUsername !=null){ usernameController = TextEditingController(text: userUsername);}
    else { usernameController = TextEditingController(text: "");}

    if (userEmail !=null){ email = userEmail;}
    else { email = "";}

    if (userInterest !=null){ interested = userInterest;}
    else { interested = [];}   

    setState(() {}); // durum güncelledigimizde setstate kull.
  }
  
  //hafizaya yaz
  writeStorage() async{ //asenkron bir işlev kullanabilmek için async. tanimladık.
    final SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setBool("active",active);
    storage.setString("fullname", fullnameController.text);
    storage.setString("username", usernameController.text);
    storage.setString("email", "value@gmail.com");
    storage.setStringList("interest", interested);
  }
  
  //hafizayi sil
  clearStorage() async{
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Storage"),
        actions: [
          InkWell(
            onTap: clearStorage,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete),
            ),
          ),
          InkWell(//tiklandiginda writestoage fonk. calistiran buton haline geldi
            onTap: writeStorage,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.save),
            ),
          ),
        ],//AppBar'ın bir özelliği. aksiyon-liste
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
              Text("Account Status:"),
              Switch(value: active,//en guncel degeri burada tutuyor.
               onChanged: (value){
                active = value;
                setState(() {});//statefull durum degerleri degistirildiginde durumları güncellemek için 
               })
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Fullname:"),
              SizedBox(width: 20,),
              Expanded(
                child: TextField(
                  controller:fullnameController,
                  /*onChanged: (value){
                    fullname = value;
                    setState(() {});//statefull durum
                  },*/
                ),
              )//metni almak içindir fakat expanded içerisinde olmalıdır.
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Username:"),
              SizedBox(width: 20,),
              Expanded(
                child: TextField(
                  controller:usernameController,//yazi günceleme yöneticisi
                  /*onChanged: (value){
                    username = value;
                    setState(() {}); //verinin güncellendiğini bu yolla bildirebiliyoruz fakat veri aktarımı yapamıyoruz.
                  },*/
                ),
              )//metni almak içindir fakat expanded içerisinde olmalıdır.
            ],
            ),
          ElevatedButton(onPressed: readStorage, child: Text("Read"),),
          //ElevatedButton(onPressed: writeStorage, child: Text("Saved"),),
          //ElevatedButton(onPressed: clearStorage, child: Text("Clear"),),        
         ],),
      ),


    );
  }
}