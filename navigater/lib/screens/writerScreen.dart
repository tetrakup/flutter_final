import 'package:flutter/material.dart';

class writerScreen extends StatelessWidget {
  writerScreen({Key? key}) : super(key: key);

  final List<String> writerImages = [
    'assets/images/p1.jpg',
    'assets/images/p2.jpg',
    'assets/images/p3.jpg',
    'assets/images/p4.jpg',
    'assets/images/p5.jpg',
    'assets/images/p6.jpg',
    'assets/images/p7.jpg',
    'assets/images/p8.jpg',
    'assets/images/p9.jpg',
    'assets/images/p10.jpg',
    'assets/images/p11.jpg',
    'assets/images/p12.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Author"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Kutu rengi
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Author Photos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: 8.0),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: List.generate(
                  writerImages.length,
                  (index) {
                    return InkWell(
                      onTap: () { },
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            writerImages[index],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: writerScreen(),
  ));
}
