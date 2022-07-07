import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../models/home_mode;.dart';
import '../../shared/bloc/cubit/cubit.dart';
import '../../shared/bloc/cubit/states.dart';
import '../../shared/styles/colors.dart';
import 'Product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesState) {
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
        return cubit.homeModel != null && cubit.categoriesModel != null
            ? productBuilder(cubit.homeModel!, cubit.categoriesModel!, context)
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget productBuilder(
      HomeModel homeModel, CategoriesModel categoriesModel, context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.all(15.0),
            child: CarouselSlider(
              items: homeModel.data!.banners
                  .map(
                    (e) => Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage('${e.image}'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.26,
                autoPlay: true,
                aspectRatio: 1.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 100.0,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildCategoryItem(
                        categoriesModel.data!.data[index], context),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10.0,
                    ),
                    itemCount: categoriesModel.data!.data.length,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'New Products',
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.57,
            children: List.generate(
              homeModel.data!.products.length,
              (index) =>
                  buildGridProduct(homeModel.data!.products[index], context),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(DataModel dataModel, BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: NetworkImage('${dataModel.image}'),
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 0.27,
          fit: BoxFit.cover,
        ),
        Container(
          width: 100.0,
          color: Colors.black.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            '${dataModel.name}',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildGridProduct(ProductModel model, BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return GestureDetector(
      onTap: () {
        navigateTo(context, ProductDetailsScreen(productId: model.id));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('${model.image}'),
                width: double.infinity,
                height: 200.0,
              ),
              if (model.discount != 0)
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
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    richText(
                        text: '${model.price}', color: defaultColor, size: 18),
                    const SizedBox(
                      width: 5,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.oldPrice.round()}',
                        style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey[700],
                            color: Colors.grey[700]),
                      ),
                    const Spacer(),
                    IconButton(
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: cubit.favorites[model.id]!
                            ? defaultColor
                            : Colors.grey,
                        child: const Icon(
                          Icons.favorite_rounded,
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      splashRadius: 20.0,
                      splashColor: cubit.favorites[model.id]!
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
    );
  }
}
