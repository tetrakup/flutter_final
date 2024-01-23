import 'package:flutter/material.dart';


class Kategoriler extends StatefulWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  State<Kategoriler> createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  final item = {
    "image": [
      "images/wombo22.jpg",//1fant
      "images/wombo23.jpg",//2roman
      "images/wombo2.jpeg",//3aks
      "images/wombo3.jpeg",//4bilmkur
      "images/wombo4.jpeg",//5genel kurg
      "images/wombo5.jpeg",//6genç kurg
      "images/wombo6.jpeg",//7 gerilim
      "images/wombo7.jpeg",//8gizem
      "images/wombo8.jpeg",//9hayrankurgu
      "images/wombo9.jpeg",
      "images/wombo10.jpeg",
      "images/wombo11.jpeg",
      "images/wombo12.jpeg",
      "images/wombo13.jpeg",
      "images/wombo14.webp",
      "images/wombo15.jpeg",
      "images/wombo16.jpeg",
      "images/wombo17.jpeg",
      "images/wombo18.jpeg",
      "images/wombo19.jpeg",
      "images/wombo20.jpeg",
      "images/wombo21.jpg",
      "images/wombo24.jpg",
    ],
    "name": [
  "Fantasy",
  "Novel",
  "Action",
  "Science Fiction",
  "General Fiction",
  "Young Adult Fiction",
  "Thriller",
  "Mystery",
  "Science Fantasy",
  "Classics",
  "Horror",
  "Non-Fiction",
  "Short Story",
  "Adventure",
  "Humor",
  "Paranormal",
  "Random",
  "Romance",
  "Spiritual",
  "Historical Fiction",
  "Vampire",
  "Poetry",
  "Philosophy"
    ]
  };

  /// /
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Categories"),),
      backgroundColor:Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: item["image"]!.length,
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      fit: StackFit.expand,
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                            ).createShader(
                                Rect.fromLTRB(0, 30, rect.width, rect.height));
                        },
                          blendMode: BlendMode.dstIn,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black,Colors.greenAccent])),)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, left: 5),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              item["name"]![index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: Colors.white,fontSize: 16)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}