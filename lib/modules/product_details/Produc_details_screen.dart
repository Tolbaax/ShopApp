import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  int? productId;
  ProductDetailsScreen({Key? key, this.productId}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('product Details'),
        ),
      ),
    );
  }
}
