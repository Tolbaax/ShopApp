import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/modules/categories/categoris_details_screen.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, index) {},
      builder: (context, index) {
        return ListView.builder(
          itemBuilder: (context, index) => buildCatItem(
            ShopCubit.get(context).categoriesModel!.data!.data[index],
            context,
          ),
          itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model, context) => Padding(
        padding: const EdgeInsetsDirectional.all(10.0),
        child: GestureDetector(
          onTap: () {
            navigateTo(context, const CategoriesDetailsScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: defaultColor),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.height * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: NetworkImage('${model.image}'),
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '${model.name}',
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: defaultColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
