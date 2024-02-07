class OnBoardingEntity {
  final String? image;
  final String? title;
  final String? description;

  OnBoardingEntity({this.image, this.title, this.description});

  static List<OnBoardingEntity> onBoardingData = [
    OnBoardingEntity(
      image: "books.jpg",
      title: "Kitap Dünyasına Adım Atın",
      description:
          "En popüler kitapları ve öne çıkan yazarları keşfedin! Sizi bekleyen macera dolu dünyayı keşfedin!",
    ),
    OnBoardingEntity(
      image: "books2.jpg",
      title: "Yazarların İzinde",
      description:
          "Dünya genelindeki yazarların hayatları ve eserleriyle tanışın!",
    ),
    OnBoardingEntity(
      image: "books3.jpg",
      title: "Kategorilere Yolculuk",
      description:
          "Farklı kategorilerdeki binlerce heyecan verisi kitabı keşfet!",
    ),
  ];
}
