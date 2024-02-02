//bunu sonradan ekledim
import 'package:flutter/material.dart';
import 'package:navigater/services/responsive.dart';

class writersScreen extends StatefulWidget {
  const writersScreen({super.key});

  @override
  State<writersScreen> createState() => _writersScreenState();
}

class _writersScreenState extends State<writersScreen> {
  Screen device = Screen.mobile;

  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size;//bu bize genişlik ve yükseklik boyutlarını verir.
    //final screenOrientation = MediaQuery.of(context).orientation;//cihazın yatay/dikey durumda old. billisini verir.
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/p1.jpg"),
                  radius: 32,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Arda Emre"),
                    RichText(
  text: TextSpan(
    style: TextStyle(
      fontSize: 10,
      color: Colors.grey.shade400,
    ),
    children: [
      TextSpan(
        text:
            "Oğuz Atay, 12 Ekim 1934'te Kastamonu'nun İnebolu ilçesinde dünyaya geldi. Babası, ağır ceza yargıcı ve Cumhuriyet Halk Partisi (CHP) VI. ve VII. dönem Sinop, VIII. dönem Kastamonu vekili Cemil Atay'dır. İlk ve ortaokulu Ankara'da okuyan Atay, 1951'de bugünkü adı TED Ankara Koleji olan Ankara Maarif Koleji'nden, 1957'de İstanbul Teknik Üniversitesi İnşaat Fakültesi'nden mezun oldu. Askerliğini 1957-59 yılları arasında yaptıktan sonra tamir ve kontrol elemanı olarak Kadıköy vapur iskelesinin yapımında çalıştı. Görevinden istifa ettikten sonra İstanbul Devlet Mühendislik ve Mimarlık Akademisi (şimdiki Yıldız Teknik Üniversitesi) İnşaat Bölümü'nde öğretim üyesi oldu. 1975'te doçent olan Atay, Topografya adlı bir de mesleki kitap yazdı. Çeşitli dergi ve gazetelerde makale ve söyleşileri yayımlandı. Oğuz Atay, Tutunamayanlar'ın 1971-72'de yayımlanmasından sonra, önemli bir tartışmanın odak noktası oldu. Bu romanıyla 1970 TRT Roman Ödülü'nü kazandı. Roman, Oğuz Atay'ın 20. ölüm yıldönümü olan 1997 yılında UNESCO tarafından 20. yüzyıl Türk edebiyatının en seçkin eseri olarak seçilmiştir.[3]",
      ),
    ],
  ),
),

                    /*Text(
                        "Oğuz Atay, 12 Ekim 1934'te Kastamonu'nun İnebolu ilçesinde dünyaya geldi. Babası, ağır ceza yargıcı ve Cumhuriyet Halk Partisi (CHP) VI. ve VII. dönem Sinop, VIII. dönem Kastamonu vekili Cemil Atay'dır. İlk ve ortaokulu Ankara'da okuyan Atay, 1951'de bugünkü adı TED Ankara Koleji olan Ankara Maarif Koleji'nden, 1957'de İstanbul Teknik Üniversitesi İnşaat Fakültesi'nden mezun oldu. Askerliğini 1957-59 yılları arasında yaptıktan sonra tamir ve kontrol elemanı olarak Kadıköy vapur iskelesinin yapımında çalıştı. Görevinden istifa ettikten sonra İstanbul Devlet Mühendislik ve Mimarlık Akademisi (şimdiki Yıldız Teknik Üniversitesi) İnşaat Bölümü'nde öğretim üyesi oldu. 1975'te doçent olan Atay, Topografya adlı bir de mesleki kitap yazdı. Çeşitli dergi ve gazetelerde makale ve söyleşileri yayımlandı. Oğuz Atay, Tutunamayanlar'ın 1971-72'de yayımlanmasından sonra, önemli bir tartışmanın odak noktası oldu. Bu romanıyla 1970 TRT Roman Ödülü'nü kazandı. Roman, Oğuz Atay'ın 20. ölüm yıldönümü olan 1997 yılında UNESCO tarafından 20. yüzyıl Türk edebiyatının en seçkin eseri olarak seçilmiştir.[3]",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade400,
                        ),
                        textAlign: TextAlign.left,
                        softWrap: true,//sayfa sınırına ulaşt. alt satıra geçer.
                        ),
                  */
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: null,
      bottomNavigationBar: null,
    );
  }
}
