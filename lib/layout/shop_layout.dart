import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop App'
        ),
      ),
      body: TextButton(
        onPressed: (){
          CacheHelper.removeData(key: 'token').then((value) {
            if(value)
              {
                navigateAndRemoveUntil(context, LoginScreen());
              }
          });
        },
        child: const Text(
            'SIGN OUT',
          style: TextStyle(fontSize: 18,color: Colors.red),
        ),
      ),
    );
  }
}
