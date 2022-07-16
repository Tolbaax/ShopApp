import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/login_model.dart';

import '../../../models/change_cart_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNav extends ShopStates {}

class ShopChangeTheme extends ShopStates {}

class ShopChangeNotification extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopLoadingCategoriesState extends ShopStates {}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopChangeFavoritesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates {
  final ChangeFavoritesModel model;
  ShopSuccessChangeFavoritesState(this.model);
}

class ShopErrorChangeFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {
  ShopLoginModel loginModel;
  ShopSuccessUserDataState({required this.loginModel});
}

class ShopErrorUserDataState extends ShopStates {}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates {
  ShopLoginModel loginModel;
  ShopSuccessUpdateUserState({required this.loginModel});
}

class ShopErrorUpdateUserState extends ShopStates {}

class ShopLoadingGetCartsState extends ShopStates {}

class ShopSuccessGetCartsState extends ShopStates {}

class ShopErrorGetCartsState extends ShopStates {}

class ShopChangeCartState extends ShopStates {}

class ShopSuccessChangeCartState extends ShopStates {
  final ChangeCartModel model;
  ShopSuccessChangeCartState(this.model);
}

class ShopErrorChangeCartState extends ShopStates {}

class ShopPlusQuantityState extends ShopStates {}

class ShopMinusQuantityState extends ShopStates {}

class ShopLoadingUpdateCartState extends ShopStates {}

class ShopSuccessUpdateCartState extends ShopStates {}

class ShopErrorUpdateCartState extends ShopStates {}
