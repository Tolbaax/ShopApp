import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/products/Product_details_screen.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../shared/components/widgets.dart';
import '../../shared/styles/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeCartState) {
          if (!state.model.status!) {
            showToast(
                text: state.model.message.toString(), state: ToastState.error);
          } else if (state.model.status!) {
            showToast(
                text: state.model.message.toString(),
                state: ToastState.success);
          } else {
            showToast(
                text: state.model.message.toString(),
                state: ToastState.warning);
          }
        }
      },
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
            title: const Center(
              child: Text(
                'Cart     ',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          body: cubit.cartModel!.data!.cartItems!.isNotEmpty
              ? ConditionalBuilder(
                  condition: cubit.cartModel != null,
                  builder: (context) => Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  ProductDetailsScreen(
                                    productId: cubit.cartModel!.data!
                                        .cartItems![index].product!.id,
                                  ));
                            },
                            child: cartItemBuilder(
                                cubit.cartModel!.data!.cartItems![index],
                                context,
                                index),
                          ),
                          itemCount: cubit.cartModel!.data!.cartItems!.length,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.101,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 20.0, end: 20.0, bottom: 20.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amount Price',
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  const Spacer(),
                                  richText(
                                    text: '${cubit.cartModel!.data!.total}',
                                    size: 27.5,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.101,
                                width: MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                    color: defaultColor,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Check Out',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 14.0,
                                      child: Text(
                                        '${cubit.cartModel!.data!.cartItems!.length}',
                                        style: const TextStyle(
                                          color: defaultColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : emptyCart(context),
        );
      },
    );
  }
}
