import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String yazarAdi;
  final String dogumTarihi;
  final String meslek;
  final String onemliEserler;
  final String metin;
  final String avatarImagePath;

  PostWidget({
    required this.yazarAdi,
    required this.dogumTarihi,
    required this.meslek,
    required this.onemliEserler,
    required this.metin,
    required this.avatarImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatarImagePath),
                radius: 45,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      yazarAdi,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Doğum Tarihi: $dogumTarihi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Meslek: $meslek',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Öne Çıkan Eserler: $onemliEserler',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text(yazarAdi),
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(avatarImagePath),
                            radius: 45,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Doğum Tarihi: $dogumTarihi',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Meslek: $meslek',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Öne Çıkan Eserler: $onemliEserler',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Text(
                            metin,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Text(
              'Detayları Gör',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yazarlar'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          PostWidget(
            yazarAdi: 'Oğuz Atay',
            avatarImagePath: "assets/images/p1.jpg",
            dogumTarihi: 'Ekim 1934',
            meslek: 'Yazar, Mühendis, Eğitmen',
            onemliEserler:
                'Tutunamayanlar, Tehlikeli Oyunlar, Korkuyu Beklerken',
            metin:
                'Oğuz Atay, Türk edebiyatının en önemli yazarlarından biridir. Hem edebi tarzı hem de eserlerindeki derinlik ve eleştirel yaklaşımıyla tanınır. Eserlerinde toplumsal ve bireysel sorunları işlerken, çağının ötesine geçen bir evren yaratmıştır. "Tutunamayanlar", Türk edebiyatının klasikleri arasında kabul edilen bir eserdir ve çağdaş Türk edebiyatının en önemli yapıtlarından biri olarak değerlendirilir. Oğuz Atay, edebiyat dünyasına kattığı derinlik ve özgünlük ile Türk okurlarının kalbinde özel bir yer edinmiştir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Malcolm Gladwell',
            avatarImagePath: "assets/images/p2.jpg",
            dogumTarihi: '3 Eylül 1963',
            meslek: 'Yazar, Gazeteci',
            onemliEserler: 'The Tipping Point, Blink, Outliers',
            metin:
                'Malcolm Gladwell, çağdaş popüler bilim yazarlarından biridir. Sıradışı düşünme tarzı ve olaylara getirdiği farklı bakış açılarıyla tanınır. Eserlerinde psikoloji, sosyoloji ve davranış bilimleri alanlarına dair ilginç bulguları okuyucularla buluşturur. "The Tipping Point", "Blink" ve "Outliers" gibi eserleri, geniş kitleler tarafından ilgiyle okunan ve tartışılan kitaplar arasındadır. Gladwell, kompleks konuları anlaşılır bir dille aktararak okuyucularına yeni bakış açıları sunar ve düşünmeye teşvik eder.',
          ),
          // Diğer yazarlar için de aynı şekilde PostWidget kullanılabilir.
                    SizedBox(height: 10), // Boşluk ekleniyor
          PostWidget(
            yazarAdi: 'Emily Dickinson',
            avatarImagePath: "assets/images/p3.jpg",
            dogumTarihi: '10 Aralık 1830',
            meslek: 'Şair',
            onemliEserler: 'Complete Poems of Emily Dickinson',
            metin:
                'Emily Dickinson, Amerikan edebiyatının en önemli şairlerinden biridir. Yalnızca kendisine has bir tarzı ve derin bir duygusallığıyla tanınır. Eserlerinde genellikle aşk, ölüm, doğa ve ruhani konuları işler. Şiirlerinde yoğun bir iç dünya ve derin bir duygu evreni yaratır. "Complete Poems of Emily Dickinson" adlı eseri, Dickinsonın tüm şiirlerini içeren kapsamlı bir derlemedir ve edebiyat dünyasında önemli bir yere sahiptir. Dickinsonın şiirleri, onun benzersiz dili ve derin duygusal derinliğiyle edebi mirasının bir parçası olarak değerlendirilir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Can Yücel',
            avatarImagePath: "assets/images/p4.jpg",
            dogumTarihi: '21 Ağustos 1926',
            meslek: 'Şair, Yazar, Çevirmen',
            onemliEserler: 'Şiirler, Seçme Şiirler',
            metin:
                'Can Yücel, Türk edebiyatının önemli şairlerinden biridir. Genellikle mizahi ve ironik bir üslupla yazdığı şiirleriyle tanınır. Eserlerinde genellikle aşk, doğa ve toplumsal eleştirileri işler. Sadelik ve içtenlikle kaleme aldığı şiirleri, geniş bir okuyucu kitlesi tarafından sevilir. "Şiirler" ve "Seçme Şiirler" gibi eserleri, Türk edebiyatının önemli yapıtları arasında yer alır. Can Yücel, eserleriyle Türk şiir geleneğine önemli katkılarda bulunmuş ve edebiyat dünyasında özel bir yere sahiptir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Özdemir Asaf',
            avatarImagePath: "assets/images/p5.jpg",
            dogumTarihi: '11 Haziran 1923',
            meslek: 'Şair',
            onemliEserler: 'Birkaç Damla Gözyaşı',
            metin:
                'Özdemir Asaf, Türk edebiyatının önemli şairlerinden biridir. Eserlerinde genellikle aşk ve insanın iç dünyası gibi temaları işler. "Birkaç Damla Gözyaşı" adlı eseri, en bilinen ve sevilen kitaplarından biridir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Dylan Thomas',
            avatarImagePath: "assets/images/p6.jpg",
            dogumTarihi: '27 Ekim 1914',
            meslek: 'Şair ve Yazar',
            onemliEserler: 'Do Not Go Gentle into That Good Night',
            metin:
                'Dylan Thomas, Galli bir şair ve yazardır. Eserlerinde genellikle doğa, ölüm ve insanın varoluşu gibi evrensel temaları işler. "Do Not Go Gentle into That Good Night" adlı şiiri, en ünlü eserlerindendir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Fernando Pessoa',
            avatarImagePath: "assets/images/p7.jpg",
            dogumTarihi: '13 Haziran 1888',
            meslek: 'Şair ve Yazar',
            onemliEserler: 'The Book of Disquiet',
            metin:
                'Fernando Pessoa, Portekizli bir şair ve yazardır. Eserlerinde genellikle kimlik, varoluş ve insanın iç dünyası gibi derin temaları ele alır. "The Book of Disquiet" adlı eseri, edebiyat dünyasında büyük bir etki yaratmıştır.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Ahmed Arif',
            avatarImagePath: "assets/images/p8.jpg",
            dogumTarihi: '3 Nisan 1927',
            meslek: 'Şair',
            onemliEserler: 'Hasretinden Prangalar Eskittim',
            metin:
                'Ahmed Arif, Türk edebiyatının önemli şairlerinden biridir. Eserlerinde genellikle aşk, vatan, özgürlük gibi temaları işler. "Hasretinden Prangalar Eskittim" adlı eseri, en bilinen ve sevilen şiirlerindendir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Haluk Bilginer',
            avatarImagePath: "assets/images/p9.jpg",
            dogumTarihi: '5 Haziran 1954',
            meslek: 'Oyuncu ve Yazar',
            onemliEserler: 'Bilinmiyor',
            metin:
                'Haluk Bilginer, Türk oyuncu ve yazardır. Hem tiyatro sahnesinde hem de sinema dünyasında önemli başarılara imza atmıştır. Yazar olarak da eserler vermiştir ancak önemli bir eseri bilinmemektedir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Nihan Kaya',
            avatarImagePath: "assets/images/p10.jpg",
            dogumTarihi: '23 Temmuz 1978',
            meslek: 'Yazar ve Şair',
            onemliEserler: 'Aşkla Kal',
            metin:
                'Nihan Kaya, Türk yazar ve şairdir. Eserlerinde genellikle aşk, tutku ve yaşamın anlamı gibi temaları işler. "Aşkla Kal" adlı eseri, en bilinen ve sevilen kitaplarındandır.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Nilgün Marmara',
            avatarImagePath: "assets/images/p11.jpg",
            dogumTarihi: '15 Mart 1948',
            meslek: 'Yazar',
            onemliEserler: 'Yanık Sarı',
            metin:
                'Nilgün Marmara, Türk yazar ve senaristtir. Eserlerinde genellikle kadınların iç dünyasını, toplumsal sorunları ve aşkı ele alır. "Yanık Sarı" adlı eseri, en bilinen ve sevilen kitaplarındandır.',
          ),
          //diğer yazarlar
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PostListPage(),
  ));
}

/*import 'package:flutter/material.dart';
/*
import 'package:flutter/material.dart';
import 'package:your_app_name/post_list_page.dart'; // Örnek bir import, kendi proje yapınıza göre değiştirin

*/
class PostWidget extends StatefulWidget {
  final String yazarAdi;
  final String dogumTarihi;
  final String meslek;
  final String onemliEserler;
  final String metin;
  final String avatarImagePath; //yazar foto yolu

  PostWidget({
    required this.yazarAdi,
    required this.dogumTarihi,
    required this.meslek,
    required this.onemliEserler,
    required this.metin,
    required this.avatarImagePath,
  });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool begenildi = false;
  bool metinGoruluyor = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[200], // Gri arkaplan rengi
        borderRadius: BorderRadius.circular(10), // Yuvarlatılmış kenarlıklar
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Gölgelendirme rengi
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // Gölgenin yönü ve uzunluğu
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  // Avatar resmini ağaç yapısından alıyoruz
                  backgroundImage: AssetImage(widget.avatarImagePath),
                  radius: 45,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.yazarAdi,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.dogumTarihi,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Meslek: ${widget.meslek}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Öne Çıkan Eserler: ${widget.onemliEserler}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: begenildi ? Colors.purple : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    begenildi = !begenildi;
                  });
                },
              ),
            ],
          ),
          if (metinGoruluyor)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.metin,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          TextButton(
            onPressed: () {
              setState(() {
                metinGoruluyor = !metinGoruluyor;
              });
            },
            child: Text(
              metinGoruluyor ? "Daha Az Gör" : "Data Fazlasını Gör",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yazarlar'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10), // ListView'in kenar boşlukları
        children: [
          PostWidget(
            yazarAdi: 'Oğuz Atay',
            avatarImagePath: "assets/images/p1.jpg",
            dogumTarihi: 'Ekim 1934',
            meslek: 'Yazar, Mühendis, Eğitmen',
            onemliEserler:
                'Tutunamayanlar, Tehlikeli Oyunlar, Korkuyu Beklerken',
            metin:
                'Oğuz Atay, Türk edebiyatının en önemli yazarlarından biridir. Hem edebi tarzı hem de eserlerindeki derinlik ve eleştirel yaklaşımıyla tanınır. Eserlerinde toplumsal ve bireysel sorunları işlerken, çağının ötesine geçen bir evren yaratmıştır. "Tutunamayanlar", Türk edebiyatının klasikleri arasında kabul edilen bir eserdir ve çağdaş Türk edebiyatının en önemli yapıtlarından biri olarak değerlendirilir. Oğuz Atay, edebiyat dünyasına kattığı derinlik ve özgünlük ile Türk okurlarının kalbinde özel bir yer edinmiştir.',
          ),
          SizedBox(height: 10), // Boşluk ekleniyor
          PostWidget(
            yazarAdi: 'Malcolm Gladwell',
            avatarImagePath: "assets/images/p2.jpg",
            dogumTarihi: '3 Eylül 1963',
            meslek: 'Yazar, Gazeteci',
            onemliEserler: 'The Tipping Point, Blink, Outliers',
            metin:
                'Malcolm Gladwell, çağdaş popüler bilim yazarlarından biridir. Sıradışı düşünme tarzı ve olaylara getirdiği farklı bakış açılarıyla tanınır. Eserlerinde psikoloji, sosyoloji ve davranış bilimleri alanlarına dair ilginç bulguları okuyucularla buluşturur. "The Tipping Point", "Blink" ve "Outliers" gibi eserleri, geniş kitleler tarafından ilgiyle okunan ve tartışılan kitaplar arasındadır. Gladwell, kompleks konuları anlaşılır bir dille aktararak okuyucularına yeni bakış açıları sunar ve düşünmeye teşvik eder.',
          ),
          SizedBox(height: 10), // Boşluk ekleniyor
          PostWidget(
            yazarAdi: 'Emily Dickinson',
            avatarImagePath: "assets/images/p3.jpg",
            dogumTarihi: '10 Aralık 1830',
            meslek: 'Şair',
            onemliEserler: 'Complete Poems of Emily Dickinson',
            metin:
                'Emily Dickinson, Amerikan edebiyatının en önemli şairlerinden biridir. Yalnızca kendisine has bir tarzı ve derin bir duygusallığıyla tanınır. Eserlerinde genellikle aşk, ölüm, doğa ve ruhani konuları işler. Şiirlerinde yoğun bir iç dünya ve derin bir duygu evreni yaratır. "Complete Poems of Emily Dickinson" adlı eseri, Dickinsonın tüm şiirlerini içeren kapsamlı bir derlemedir ve edebiyat dünyasında önemli bir yere sahiptir. Dickinsonın şiirleri, onun benzersiz dili ve derin duygusal derinliğiyle edebi mirasının bir parçası olarak değerlendirilir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Can Yücel',
            avatarImagePath: "assets/images/p4.jpg",
            dogumTarihi: '21 Ağustos 1926',
            meslek: 'Şair, Yazar, Çevirmen',
            onemliEserler: 'Şiirler, Seçme Şiirler',
            metin:
                'Can Yücel, Türk edebiyatının önemli şairlerinden biridir. Genellikle mizahi ve ironik bir üslupla yazdığı şiirleriyle tanınır. Eserlerinde genellikle aşk, doğa ve toplumsal eleştirileri işler. Sadelik ve içtenlikle kaleme aldığı şiirleri, geniş bir okuyucu kitlesi tarafından sevilir. "Şiirler" ve "Seçme Şiirler" gibi eserleri, Türk edebiyatının önemli yapıtları arasında yer alır. Can Yücel, eserleriyle Türk şiir geleneğine önemli katkılarda bulunmuş ve edebiyat dünyasında özel bir yere sahiptir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Özdemir Asaf',
            avatarImagePath: "assets/images/p5.jpg",
            dogumTarihi: '11 Haziran 1923',
            meslek: 'Şair',
            onemliEserler: 'Birkaç Damla Gözyaşı',
            metin:
                'Özdemir Asaf, Türk edebiyatının önemli şairlerinden biridir. Eserlerinde genellikle aşk ve insanın iç dünyası gibi temaları işler. "Birkaç Damla Gözyaşı" adlı eseri, en bilinen ve sevilen kitaplarından biridir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Dylan Thomas',
            avatarImagePath: "assets/images/p6.jpg",
            dogumTarihi: '27 Ekim 1914',
            meslek: 'Şair ve Yazar',
            onemliEserler: 'Do Not Go Gentle into That Good Night',
            metin:
                'Dylan Thomas, Galli bir şair ve yazardır. Eserlerinde genellikle doğa, ölüm ve insanın varoluşu gibi evrensel temaları işler. "Do Not Go Gentle into That Good Night" adlı şiiri, en ünlü eserlerindendir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Fernando Pessoa',
            avatarImagePath: "assets/images/p7.jpg",
            dogumTarihi: '13 Haziran 1888',
            meslek: 'Şair ve Yazar',
            onemliEserler: 'The Book of Disquiet',
            metin:
                'Fernando Pessoa, Portekizli bir şair ve yazardır. Eserlerinde genellikle kimlik, varoluş ve insanın iç dünyası gibi derin temaları ele alır. "The Book of Disquiet" adlı eseri, edebiyat dünyasında büyük bir etki yaratmıştır.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Ahmed Arif',
            avatarImagePath: "assets/images/p8.jpg",
            dogumTarihi: '3 Nisan 1927',
            meslek: 'Şair',
            onemliEserler: 'Hasretinden Prangalar Eskittim',
            metin:
                'Ahmed Arif, Türk edebiyatının önemli şairlerinden biridir. Eserlerinde genellikle aşk, vatan, özgürlük gibi temaları işler. "Hasretinden Prangalar Eskittim" adlı eseri, en bilinen ve sevilen şiirlerindendir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Haluk Bilginer',
            avatarImagePath: "assets/images/p9.jpg",
            dogumTarihi: '5 Haziran 1954',
            meslek: 'Oyuncu ve Yazar',
            onemliEserler: 'Bilinmiyor',
            metin:
                'Haluk Bilginer, Türk oyuncu ve yazardır. Hem tiyatro sahnesinde hem de sinema dünyasında önemli başarılara imza atmıştır. Yazar olarak da eserler vermiştir ancak önemli bir eseri bilinmemektedir.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Nihan Kaya',
            avatarImagePath: "assets/images/p10.jpg",
            dogumTarihi: '23 Temmuz 1978',
            meslek: 'Yazar ve Şair',
            onemliEserler: 'Aşkla Kal',
            metin:
                'Nihan Kaya, Türk yazar ve şairdir. Eserlerinde genellikle aşk, tutku ve yaşamın anlamı gibi temaları işler. "Aşkla Kal" adlı eseri, en bilinen ve sevilen kitaplarındandır.',
          ),
          SizedBox(height: 10),
          PostWidget(
            yazarAdi: 'Nilgün Marmara',
            avatarImagePath: "assets/images/p11.jpg",
            dogumTarihi: '15 Mart 1948',
            meslek: 'Yazar',
            onemliEserler: 'Yanık Sarı',
            metin:
                'Nilgün Marmara, Türk yazar ve senaristtir. Eserlerinde genellikle kadınların iç dünyasını, toplumsal sorunları ve aşkı ele alır. "Yanık Sarı" adlı eseri, en bilinen ve sevilen kitaplarındandır.',
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PostListPage(), // Yönlendirme için kullanılan PostListPage
  ));
}
*/