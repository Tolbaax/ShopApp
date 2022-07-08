import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:shop_app/modules/products/cubit/cubit.dart';
import 'package:shop_app/modules/products/cubit/states.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        listener: (context, states) {},
        builder: (context, states) {
          ProductCubit cubit = ProductCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
            ),
            body: ConditionalBuilder(
              condition: cubit.productDetailsModel != null,
              builder: (context) {
                return Column(
                  children: [
                    SizedBox(
                      height: 250.0,
                      child: PageView.builder(
                        itemBuilder: (context, index) {
                          return Image(
                            image: NetworkImage(
                              cubit.productDetailsModel!.data!.images![index],
                            ),
                          );
                        },
                        itemCount:
                            cubit.productDetailsModel!.data!.images!.length,
                        controller: imagesController,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          effect: const ExpandingDotsEffect(
                            activeDotColor: defaultColor,
                            expansionFactor: 4,
                            dotHeight: 10.0,
                            dotWidth: 10.0,
                            spacing: 6.0,
                          ),
                          controller: imagesController,
                          count:
                              cubit.productDetailsModel!.data!.images!.length,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20.0,
                        end: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  '${cubit.productDetailsModel!.data!.name}',
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: CircleAvatar(
                                  radius: 15.0,
                                  backgroundColor: cubit.productDetailsModel!
                                          .data!.inFavorites
                                      ? defaultColor
                                      : Colors.grey,
                                  child: const Icon(
                                    Icons.favorite_rounded,
                                    size: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                                splashRadius: 20.0,
                                // splashColor:
                                //     cubit.productDetailsModel!.data!.inFavorites
                                //         ? Colors.grey
                                //         : defaultColor,
                                onPressed: () {
                                  ShopCubit.get(context).changeFavorites(
                                    productId: productId,
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (cubit.productDetailsModel!.data!.discount != 0)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.deepOrange,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2.0),
                              child: const Text(
                                'DISCOUNT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.18,
                            child: SingleChildScrollView(
                              child: ReadMoreText(
                                '${cubit.productDetailsModel!.data!.description}',
                                numLines: 3,
                                readMoreText: 'Read More',
                                readLessText: 'Read Less',
                                readMoreTextStyle:
                                    const TextStyle(color: defaultColor),
                                readMoreIconColor: defaultColor,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16.0,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20.0,
                        end: 20.0,
                        bottom: 25.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          richText(
                              text: '${cubit.productDetailsModel!.data!.price}',
                              size: 25.0),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.063,
                            width: MediaQuery.of(context).size.width * 0.36,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: defaultColor,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.grey.shade600,
                                  ),
                                  onPressed: () {},
                                  splashRadius: 20,
                                  splashColor: defaultColor,
                                ),
                                const Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: defaultColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.grey.shade600,
                                  ),
                                  onPressed: () {},
                                  splashRadius: 20,
                                  splashColor: defaultColor,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ShopCubit.get(context)
                                  .changeCart(productId: productId);
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                color: cubit.productDetailsModel!.data!.inCart
                                    ? defaultColor
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 26.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
