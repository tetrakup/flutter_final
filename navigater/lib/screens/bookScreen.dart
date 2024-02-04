import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Gap(8),
          //
          BookWidget(
            kitapAdi: 'İnsanca Pek İnsanca',
            yazar: 'Frıedrıch Nıetzsche',
            avatarImagePath: "assets/images/kitap1.jpg",
            fiyat: '15tl',
            puan: '4.5',
            metin:
                'İnsanca Pek İnsanca, Friedrich Nietzsche tarafından kaleme alınan bir eserdir. Nietzsche, insanın doğasını ve varoluşunu derinlemesine ele aldığı bu eserinde, ahlaki değerlerin kaynağı ve insanın kendi değerlerini yaratma süreci üzerine düşüncelerini sunar. Kitap, Nietzschenin felsefi bakış açısını ve sorgulamalarını içerirken, aynı zamanda insanın içsel çatışmalarını ve insan doğasının karmaşıklığını da inceler.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'FRIEDRICH NIETZSCHE',
            yazar: 'İnsanca, Pek İnsanca',
            avatarImagePath: "assets/images/kitap2.jpg",
            fiyat: '20tl',
            puan: '4.7',
            metin:
                'Friedrich Nietzsche, insanın doğasını ve varoluşunu derinlemesine ele aldığı bu eserinde, ahlaki değerlerin kaynağı ve insanın kendi değerlerini yaratma süreci üzerine düşüncelerini sunar. Kitap, Nietzschenin felsefi bakış açısını ve sorgulamalarını içerirken, aynı zamanda insanın içsel çatışmalarını ve insan doğasının karmaşıklığını da inceler.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'Nietzsche Ağladığında',
            yazar: 'IRVIN D. YALOM',
            avatarImagePath: "assets/images/kitap3.jpg",
            fiyat: '18tl',
            puan: '4.6',
            metin:
                'İrvin D. Yalom, Nietzsche Ağladığında adlı eserinde, ünlü filozof Nietzsche’nin hayatının son dönemine odaklanır ve onun psikoterapi sürecini ele alır. Kitap, Nietzsche’nin felsefi görüşlerini ve kişisel yaşamını anlamak için değerli bir kaynak olarak kabul edilir.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'İNSAN NEYLE YAŞAR?',
            yazar: 'L. N. TOLSTOY',
            avatarImagePath: "assets/images/kitap4.jpg",
            fiyat: '22tl',
            puan: '4.8',
            metin:
                'L. N. Tolstoy, İnsan Neyle Yaşar? adlı eserinde, insanın yaşamını anlamak ve anlamlandırmak üzerine derinlemesine düşünür. Kitap, Tolstoy’un evrensel insanlık sorularına verdiği cevaplar ve felsefi görüşlerini içerir.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'Tutunamayanlar',
            yazar: 'Oğuz Atay',
            avatarImagePath: "assets/images/kitap5.jpg",
            fiyat: '25tl',
            puan: '4.9',
            metin:
                'Oğuz Atay, Türk edebiyatının klasikleri arasında kabul edilen Tutunamayanlar adlı eserinde, toplumsal ve bireysel sorunları işlerken, çağının ötesine geçen bir evren yaratmıştır. Roman, çağdaş Türk edebiyatının en önemli yapıtlarından biri olarak değerlendirilir.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'ALDATMA SANATI',
            yazar: 'Kevin D. Mitnick William L. Simon',
            avatarImagePath: "assets/images/kitap6.jpg",
            fiyat: '21tl',
            puan: '4.7',
            metin:
                'Kevin D. Mitnick ve William L. Simon, Aldatma Sanatı adlı eserinde, siber güvenlik ve bilgisayar korsanlığı konularına odaklanır. Kitap, güvenlik açıklarını ve siber saldırıları anlamak, önlem almak ve korunmak için değerli bir kaynak olarak kabul edilir.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'HUZURSUZLUĞUN KİTABI',
            yazar: 'FERNANDO PESSOA',
            avatarImagePath: "assets/images/kitap7.jpg",
            fiyat: '19tl',
            puan: '4.5',
            metin:
                'Fernando Pessoa, Huzursuzluğun Kitabı adlı eserinde, kimlik, varoluş ve insanın iç dünyası gibi derin temaları ele alır. Kitap, Pessoa’nın benzersiz tarzını ve derin düşüncelerini okuyucularla buluşturur.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'BEYAZ ZAMBAKLAR ÜLKESİNDE',
            yazar: 'Grigoriy Petrov',
            avatarImagePath: "assets/images/kitap8.jpg",
            fiyat: '24tl',
            puan: '4.6',
            metin:
                'Grigoriy Petrov, Beyaz Zambaklar Ülkesinde adlı eserinde, sosyalist devrim ve toplumsal değişim konularını ele alır. Roman, Rus edebiyatının önemli eserleri arasında kabul edilir ve geniş bir okuyucu kitlesi tarafından sevilir.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'Outliers',
            yazar: 'MALCOLM GLADWELL',
            avatarImagePath: "assets/images/kitap9.jpg",
            fiyat: '23tl',
            puan: '4.8',
            metin:
                'Malcolm Gladwell, Outliers adlı eserinde, başarı ve olağandışı başarıların arkasındaki gizli faktörleri ele alır. Kitap, psikoloji, sosyoloji ve davranış bilimleri alanlarındaki bulguları okuyucularla buluşturur ve yeni bakış açıları sunar.',
          ),
          Gap(8),
          BookWidget(
            kitapAdi: 'Fareler ve İnsanlar',
            yazar: 'John Steinbeck',
            avatarImagePath: "assets/images/kitap10.jpg",
            fiyat: '20tl',
            puan: '4.7',
            metin:
                'John Steinbeck, Fareler ve İnsanlar adlı eserinde, Amerikan Rüyası’nın yanılsamasını ve insan doğasının karmaşıklığını ele alır. Roman, Steinbeck’in benzersiz anlatımı ve derin karakter analizleriyle dikkat çeker.',
          ),
        ],
      ),
    );
  }
}

class BookWidget extends StatelessWidget {
  final String kitapAdi;
  final String yazar;
  final String avatarImagePath;
  final String fiyat;
  final String puan;
  final String metin;

  BookWidget({
    required this.kitapAdi,
    required this.yazar,
    required this.avatarImagePath,
    required this.fiyat,
    required this.puan,
    required this.metin,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(avatarImagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kitapAdi,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Yeni eklenen özellik
                            ),
                          ),
                          Text(
                            'Yazar: $yazar',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey, // Yeni eklenen özellik
                            ),
                          ),
                          Gap(35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Fiyatı: $fiyat',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // Yeni eklenen özellik
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Puanı: ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // Yeni eklenen özellik
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                puan,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // Yeni eklenen özellik
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetailsScreen(
                                    kitapAdi: kitapAdi,
                                    yazar: yazar,
                                    avatarImagePath: avatarImagePath,
                                    fiyat: fiyat,
                                    puan: puan,
                                    metin: metin,
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
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsScreen(
                              kitapAdi: kitapAdi,
                              yazar: yazar,
                              avatarImagePath: avatarImagePath,
                              fiyat: fiyat,
                              puan: puan,
                              metin: metin,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
/*          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(
                    kitapAdi: kitapAdi,
                    yazar: yazar,
                    avatarImagePath: avatarImagePath,
                    fiyat: fiyat,
                    puan: puan,
                    metin: metin,
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
          ),*/
        ],
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final String kitapAdi;
  final String yazar;
  final String avatarImagePath;
  final String fiyat;
  final String puan;
  final String metin;

  BookDetailsScreen({
    required this.kitapAdi,
    required this.yazar,
    required this.avatarImagePath,
    required this.fiyat,
    required this.puan,
    required this.metin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(avatarImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              kitapAdi,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Yeni eklenen özellik
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Yazar: $yazar',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.grey, // Yeni eklenen özellik
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  index < int.parse(puan.split('.')[0])
                      ? Icons.star
                      : Icons.star_border,
                  color: index < int.parse(puan.split('.')[0])
                      ? Colors.amber
                      : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              metin,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookScreen(),
  ));
}
