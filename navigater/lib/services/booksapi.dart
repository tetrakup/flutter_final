import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  final apiKey = 'AIzaSyB79hh9O7Bbeokqu8UNhJ5yCWmwic17J8w';
  final query = 'flutter';

  try {
    final response = await dio.get(
      'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey',
    );

    if (response.statusCode == 200) {
      final data = response.data;
      // Gelen veriyi işleme
      print(data);
    } else {
      print('API isteği başarısız oldu');
    }
  } catch (e) {
    print('API isteği sırasında bir hata oluştu: $e');
  }
}
