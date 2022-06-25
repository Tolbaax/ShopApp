import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/favorites_model.dart';
import '../../shared/bloc/cubit/cubit.dart';
import '../../shared/bloc/cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

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
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                buildFavItem(cubit.favoritesModel!.data!.data![index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.favoritesModel!.data!.data!.length,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildFavItem(FavoritesData model, context) {
    ShopCubit cubit = ShopCubit.get(context);
    return Padding(
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
                    image: NetworkImage('${model.product!.image}'),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (model.product!.discount != 0)
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
                    '${model.product!.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model.product!.price}\$',
                        style: const TextStyle(
                            color: defaultColor, fontSize: 18.0),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (model.product!.discount != 0)
                        Text(
                          '${model.product!.oldPrice}\$',
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
                          backgroundColor: cubit.favorites[model.product!.id]
                              ? defaultColor
                              : Colors.grey,
                          child: const Icon(
                            Icons.favorite_rounded,
                            size: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        splashRadius: 20.0,
                        splashColor: cubit.favorites[model.product!.id]
                            ? Colors.grey
                            : defaultColor,
                        onPressed: () {
                          cubit.changeFavorites(productId: model.product!.id);
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
    );
  }
}
