class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({required this.title, required this.image, required this.body});
}

List<BoardingModel> boarding = [
  BoardingModel(
      title: 'Cash Back',
      image: 'assets/images/onboard1.png',
      body: 'Smart Payment'),
  BoardingModel(
      title: 'Cash Back',
      image: 'assets/images/onboard2.png',
      body: 'Smart LifeStyle'),
  BoardingModel(
      title: 'Cash Back',
      image: 'assets/images/onboard3.png',
      body: 'Smart Payment'),
];
