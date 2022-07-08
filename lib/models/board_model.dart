class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({required this.title, required this.image, required this.body});
}

List<BoardingModel> boarding = [
  BoardingModel(
      title: 'Cash Back',
      image: 'assets/images/Mobile-payments.png',
      body: 'Smart Payment'),
  BoardingModel(
      title: 'Payment Process',
      image: 'assets/images/Mobile-payments.png',
      body: 'Easy and secure payment in online\npayment network'),
  BoardingModel(
      title: 'Cash Back',
      image: 'assets/images/Mobile-payments.png',
      body: 'Smart Payment'),
];
