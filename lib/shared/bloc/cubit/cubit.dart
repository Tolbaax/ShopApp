import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_mode;.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/modules/products/product_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';

class ShopCubit extends Cubit<ShopStates>
{

  ShopCubit(): super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  Map<int, bool> favorites = {};

  HomeModel? homeModel;

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNav());
  }

  //====================================================

  void getHomeData()
  {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {

      homeModel = HomeModel.fromJson(value.data);

      for (var element in homeModel!.data!.products) {
        favorites.addAll({
          element.id!: element.inFavorite!
        });
      }
      print(favorites.toString());
      printFullText(homeModel.toString());
      emit(ShopSuccessHomeDataState());

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());

    });
  }

  //====================================================

  CategoriesModel? categoriesModel;

  void getCategories()
  {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {

      categoriesModel = CategoriesModel.fromJson(value.data);
      printFullText(homeModel.toString());
      emit(ShopSuccessCategoriesState());

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

//====================================================

}