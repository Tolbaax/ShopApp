import 'package:flutter/material.dart';

import '../../models/cart_model.dart';
import '../../modules/products/Product_details_screen.dart';
import '../bloc/cubit/cubit.dart';
import '../styles/colors.dart';
import 'components.dart';

Widget buildListProduct(model, context, {bool isOldPrice = true}) {
  ShopCubit cubit = ShopCubit.get(context);
  return GestureDetector(
    onTap: () {
      navigateTo(context, ProductDetailsScreen(productId: model.id));
    },
    child: Padding(
      padding: const EdgeInsetsDirectional.all(20.0),
      child: SizedBox(
        height: 120.0,
        child: Row(
          children: [
            SizedBox(
              height: 120.0,
              width: 120.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage('${model.image}'),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (model.discount != 0 && isOldPrice)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.redAccent,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 2.0),
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${model.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      richText(
                        text: '${model.price}',
                        color: defaultColor,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          '${model.oldPrice}',
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey[700],
                            color: Colors.grey[700],
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: cubit.favorites[model.id]
                              ? defaultColor
                              : Colors.grey,
                          child: const Icon(
                            Icons.favorite_rounded,
                            size: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        splashRadius: 20.0,
                        splashColor: cubit.favorites[model.id]
                            ? Colors.grey
                            : defaultColor,
                        onPressed: () {
                          cubit.changeFavorites(productId: model.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//============================================================================

Widget cartItemBuilder(CartItems model, context, index) {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.grey.shade800,
              size: 20,
            ),
            const SizedBox(
              width: 5.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Text(
                '${model.product!.name}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[400],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 15.0, bottom: 15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.177,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${model.product!.image}',
                        ),
                      )),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        '${model.product!.name}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    richText(
                      text: '${model.product!.price}',
                      size: 18,
                      color: Colors.grey.shade700,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.69,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.width * 0.068,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: defaultColor,
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: defaultColor,
                                size: 20,
                              ),
                            ),
                            highlightColor: Colors.transparent,
                            radius: 0.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.5),
                            child: Text(
                              '${model.quantity}',
                              style: const TextStyle(
                                fontSize: 22.0,
                                color: defaultColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.width * 0.068,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: defaultColor,
                                ),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: defaultColor,
                                size: 20,
                              ),
                            ),
                            highlightColor: Colors.transparent,
                            radius: 0.0,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              ShopCubit.get(context).changeCart(
                                productId: ShopCubit.get(context)
                                    .cartModel!
                                    .data!
                                    .cartItems![index]
                                    .product!
                                    .id,
                              );
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.039,
                              width: MediaQuery.of(context).size.width * 0.075,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: defaultColor,
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            highlightColor: Colors.transparent,
                            radius: 0.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

//===========================================================================
