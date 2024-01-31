import 'package:dio/dio.dart';
//islemi dene/sunucuya baglan/kullanıcıları al/gelen cevapları kontrol et/hata yoksa geri ver:bunlar zaman alıcı ve bazen gözden kaçabilen işlemler old. için try catch yapacagız:

class API {
  final dio = Dio();
  final String baseUrl = "https://reqres.in/api";//tekrarlanan ana URL burada.
  //asenkron old. belirtmenin iki yolu: n() async{} veya Future<Veri_Türü>(){}
  getUsers({int page = 1}) async {//page1=1.sayfadan baslar
    try {
      
      final String url = "$baseUrl/users";

      final parameters = { "page": page,};
      
      final response = await dio.get(url,queryParameters: parameters); //sonucu response'a ata.
      
      return response.data;//aldıı dataları response.data içerisine at
    }
    catch (e) {//hata verdiyse e'ye ata.
    
    return e;
    }
    // } finally {}(try veya catch olsa bile)nihayet bununla sonlandır.
   
  }

  getUser({required int userId}) async {
    try {
      
      final String url = "$baseUrl/users/$userId";

      
      final response = await dio.get(url); //sonucu response'a ata.
      
      return response;//bunu daha sonra sileceğiz.
    }
    catch (e) {
      
    //hata verdiyse e'ye ata.
    // try {String url = "$baseUrl/users/2";}
    // catch (e) {//hata e'de tutulur ve hata verd. burayi calistir
    // }
  }
  //createUser(){}
}

loginUser({required String username, required String password})async{//page1=1.sayfadan baslar
    try {
      
      final String url = "base_url/login";

      final parameters = {
         "email": username,
         "password": password,
         };
      
      final response = await dio.post(url,
      data: FormData.fromMap(parameters),
      //options: Options(contentType: Headers.formUrlEncodedContentType,),//api formatı farklı olsaydı bunu uyarlamak için (x-www-form-urlencoded)
      ); //sonucu response'a ata.
      
      return response.data;//aldıı dataları response.data içerisine at
    }
    catch (e) {//hata verdiyse e'ye ata.
    
    return e;
    }
    // } finally {}(try veya catch olsa bile)nihayet bununla sonlandır.
   
  }
}


