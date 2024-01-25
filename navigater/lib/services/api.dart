import 'package:dio/dio.dart';
//islemi dene/sunucuya baglan/kullanıcıları al/gelen cevapları kontrol et/hata yoksa geri ver:bunlar zaman alıcı ve bazen gözden kaçabilen işlemler old. için try catch yapacagız:

class API {
  final dio = Dio();
  final String baseUrl = "https://reqres.in/api";//tekrarlanan ana URL burada.
  //asenkron old. belirtmenin iki yolu: n() async{} veya Future<Veri_Türü>(){}
  getUsers({int page = 1}) async {//page1=1.sayfadan baslar
    try {

      String url = "$baseUrl/users";

     final response = await dio.get(url); //sonucu response'a ata.
     print(response);
     return response;//bunu daha sonra sileceğiz.
     
    } catch (e) {
      //hata verdiyse burayi calistir
      //hata bilgilerini e degiskenine ata
      print("ERROR");
      print(e);
      }
    // } finally {}(try veya catch olsa bile)nihayet bununla sonlandır.
   
  }

  getUser() async {
    try {

      String url = "$baseUrl/users/2";
    } catch (e) {//hata e'de tutulur ve hata verd. burayi calistir

      }
  }
}
