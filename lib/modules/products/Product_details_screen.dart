import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/styles/colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  PageController imagesController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, states) {},
      builder: (context, states) {
        ShopCubit cubit = ShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
            title: const Center(child: Text('product Details')),
          ),
          body: ConditionalBuilder(
            condition: cubit.homeModel != null,
            builder: (context) {
              return Column(
                children: [
                  SizedBox(
                    height: 250.0,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return const Image(
                          image: NetworkImage(
                            'https://student.valuxapps.com/storage/uploads/products/1615440689Oojt6.item_XXL_36330138_142814947.jpeg',
                          ),
                        );
                      },
                      itemCount: 4,
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
                        count: 4,
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
                            const Text(
                              'Product Name',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const CircleAvatar(
                                radius: 15.0,
                                backgroundColor: defaultColor,
                                child: Icon(
                                  Icons.favorite_rounded,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              splashRadius: 20.0,
                              // splashColor: cubit.favorites[model.id]!
                              //     ? Colors.grey
                              //     : defaultColor,
                              onPressed: () {
                                // cubit.changeFavorites(productId: model.id);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
                              'This is a very long text to demo the usages of this package,'
                              'This is a very long text to demo the usages of this package,'
                              'This is a very long text to demo the usages of this package'
                              'This is a very long text to demo the usages of this package',
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
                      bottom: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        richText(text: '520', size: 25.0),
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
                        Container(
                          height: MediaQuery.of(context).size.height * 0.075,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: defaultColor,
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
    );
  }
}
