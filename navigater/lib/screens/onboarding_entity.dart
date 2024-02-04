class OnBoardingEntity {
  final String? image;
  final String? title;
  final String? description;

  OnBoardingEntity({this.image, this.title, this.description});

  static List<OnBoardingEntity> onBoardingData = [
    OnBoardingEntity(
      image: "assets/images/welcome.jpg",
      title: "Kitap Dünyasına Adım Atın",
      description:
          "En popüler kitapları ve öne çıkan yazarları keşfedin! Sizi bekleyen macera dolu dünyayı keşfedin!",
    ),
    OnBoardingEntity(
      image: "assets/images/welcome.jpg",
      title: "Yazarların İzinde",
      description:
          "Dünya genelindeki yazarların eşsiz dünyalarını ziyaret edin. Onların hayatları ve eserleriyle tanışın!",
    ),
    OnBoardingEntity(
      image: "assets/images/welcome.jpg",

      title: "Kategorilere Yolculuk",
      description:
          "Farklı kategorilerdeki binlerce kitabı keşfedin. Heyecan verici kitaplar sizi bekliyor!",
    ),
  ];
}
