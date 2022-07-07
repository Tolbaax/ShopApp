import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        title: const Center(child: Text('Categories Details')),
      ),
      body: Column(),
    );
  }
}
