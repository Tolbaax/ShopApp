import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/products/cubit/states.dart';
import 'package:shop_app/shared/components/constants.dart';

import '../../../models/product_details_model.dart';
import '../../../shared/network/remote/dio_helper.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  // Product Details
  ProductDetailsModel? productDetailsModel;

  void getProductDetails({required int id}) {
    emit(LoadingProductState());
    DioHelper.getData(
      url: "products/$id",
      token: token,
    ).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);

      emit(SuccessProductState());
    }).catchError((error) {
      emit(ErrorProductState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
