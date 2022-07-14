import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_app/modules/products/cubit/cubit.dart';
import 'package:shop_app/modules/products/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/widgets.dart';

import '../../shared/styles/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.productId}) : super(key: key);
  PageController imagesController = PageController();
  int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProductDetails(id: productId),
      child: BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductCubit cubit = ProductCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
            ),
            body: ConditionalBuilder(
              condition: cubit.productDetailsModel != null,
              builder: (context) {
                return productDetailsItem(context, imagesController, productId);
              },
              fallback: (context) => const Center(
                child: SpinKitCubeGrid(
                  color: defaultColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
