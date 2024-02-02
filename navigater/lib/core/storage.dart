import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  // late final storage;
  // Storage(){
  //   storage = await SharedPreferences.getInstance();
  // }

  loadUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var id = storage.getInt("id");
    var name = storage.getString("name");
    var phone = storage.getString("phone_number");
    var email = storage.getString("email");

    if(id == null) {
      //hic oturum yok
      return null;
    }
    else {
      return {"id": id, "name": name, "phone_number": phone, "email": email};
    }
  }

  saveUser({//giriş yapabilmek için bu bilgiler girilmiş olmalı
    required int id,
    required String name,
    required String email,
    required String phone}
  ) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setInt("id", id);
    storage.setString("name", name);
    storage.setString("email", email);
    storage.setString("phone_number", phone);
  }

  saveToken(String token) async{
  final storage = new FlutterSecureStorage();
  await storage.write(key: "token", value: token);
}

  loadToken() async{
  final storage = new FlutterSecureStorage();
  var token = await storage.read(key: "token");
  return token;
}

  clearUser()async{//braya  geld. tüm bilg. shared_pref. e token'dan silinecek.
  SharedPreferences storage = await SharedPreferences.getInstance();
  final secureStorage = new FlutterSecureStorage();

  await storage.remove("id");//clear da olabilirdi fakat tüm bilg. sild. için önerilmez.
  await storage.remove("name");
  await storage.remove("email");
  await storage.remove("phone_number");

  await secureStorage.delete(key :"token");
}
}
