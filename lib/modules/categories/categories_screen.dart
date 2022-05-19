import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import '../../shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, index) {},
      builder: (context, index)
      {
        return ListView.separated(
            itemBuilder: (context, index) => buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
    padding: const EdgeInsetsDirectional.all(20.0),
    child: Row(
        children: [
          Image(
            image: NetworkImage('${model.image}'),
            height: 85.0,
            width: 85.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            '${model.name}',
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
          const Spacer(),
          const Icon(
              Icons.arrow_forward_ios
          ),
        ]
    ),
  );
}
