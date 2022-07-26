class PaymentModel {
  String? imageUrl;
  String? name;

  PaymentModel({this.name, required this.imageUrl});
}

List<PaymentModel> paymentList = [
  PaymentModel(
    name: 'GoogleWallet',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/889/889114.png?w=740',
  ),
  PaymentModel(
      name: 'MasterCard',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Mastercard_2019_logo.svg/2560px-Mastercard_2019_logo.svg.png'),
  PaymentModel(
    name: 'AmazonPay',
    imageUrl:
        'https://pbs.twimg.com/profile_images/1214220012979920898/N4tFtfjN_400x400.png',
  ),
  PaymentModel(
      name: 'LibraPay',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Liberapay_logo_v2_white-on-yellow.svg/1200px-Liberapay_logo_v2_white-on-yellow.svg.png'),
  PaymentModel(
    name: 'PayPal',
    imageUrl:
        'https://seeklogo.com/images/P/paypal-logo-481A2E654B-seeklogo.com.png',
  ),
];

List<PaymentModel> paymentCategory = [
  PaymentModel(
    imageUrl:
        'https://ecommerce-platforms.com/wp-content/uploads/2020/10/amazon-pay-review-social.png',
  ),
  PaymentModel(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf5JdNgoRsSM3wTXqh8wGzQR_Shv1mqD7aOw&usqp=CAU',
  ),
];
