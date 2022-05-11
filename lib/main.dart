import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/modules/login/cubit/cubit.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/modules/on_boardng/on_boarding_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'shared/bloc/bloc_observer.dart';

void main() async{

  //make sure that everything in methode is finished, then open the app
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');

  if(onBoarding != null) {
    if(token != null) {
      widget = const ShopLayout();
    }
    else {
      widget = LoginScreen();
    }
  }
  else {
    widget = const OnBoardingScreen();
  }

  BlocOverrides.runZoned(
        () {
          // Use blocs...
          runApp( MyApp(startWidget:widget,));
          ShopLoginCubit();
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  final Widget startWidget;
  MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light,
      home: startWidget,
    );
  }
}

