import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/home_mode;.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel !=  null,
            builder: (context) => productBuilder(ShopCubit.get(context).homeModel!),
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }

  Widget productBuilder(HomeModel model) => SingleChildScrollView(
    child: Column(
      children: [
        Padding(
           padding: const EdgeInsetsDirectional.all(15.0),
           child: CarouselSlider(
               items: model.data!.banners.map((e) => Image(
                 image: NetworkImage('${e.image}'),
                 width: double.infinity,
                 fit: BoxFit.cover,
               ),).toList(),
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
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 1 / 1.3,
          children: List.generate(
              model.data!.products.length,
                  (index) => buildGridProduct(model.data!.products[index])
          ),
        ),
      ],
    ),
  );

  Widget buildGridProduct(ProductModel model) => Column(
    children: [
      Image(
        image: NetworkImage('${model.image}'),
        width: double.infinity,
        fit: BoxFit.cover,
        height: 200.0,
      ),
      Padding(
        padding: const EdgeInsetsDirectional.all(5),
        child: Text(
          '${model.name}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

