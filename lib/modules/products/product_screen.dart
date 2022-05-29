import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_mode;.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import '../../shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShopCubit.get(context).homeModel != null &&
            ShopCubit.get(context).categoriesModel != null
            ? productBuilder(ShopCubit.get(context).homeModel!,
            ShopCubit.get(context).categoriesModel!, context)
            : const Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Widget productBuilder(HomeModel homeModel, CategoriesModel categoriesModel,BuildContext context) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.all(15.0),
              child: CarouselSlider(
                items: homeModel.data!.banners.map(
                      (e) => Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ).toList(),
                options: CarouselOptions(
                  height: 250.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1.0,
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
                    style:
                    TextStyle(fontSize: 26.0, fontWeight: FontWeight.w800),
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
                        itemCount: categoriesModel.data!.data.length),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'New Products',
                    style:
                    TextStyle(fontSize: 26.0, fontWeight: FontWeight.w800),
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
              children: List.generate(homeModel.data!.products.length,
                      (index) => buildGridProduct(homeModel.data!.products[index],context),),
            ),
          ],
        ),
      );

  Widget buildCategoryItem(DataModel dataModel, BuildContext context) => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage('${dataModel.image}'),
        height: 100.0,
        width: 100.0,
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

  Widget buildGridProduct(ProductModel model, BuildContext context) => Column(
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
                color: Colors.red,
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 5.0, vertical: 2.0),
              child: const Text(
                'DISCOUNT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  '${model.price.round()}',
                  style: const TextStyle(
                    color: defaultColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (model.discount != 0)
                  Text(
                    '${model.oldPrice.round()}',
                    style: const TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.black,
                        color: Colors.red),
                  ),
                const Spacer(),
                IconButton(
                  icon: const CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.white,
                      )),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
