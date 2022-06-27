import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/bloc/cubit/cubit.dart';
import '../../shared/bloc/cubit/states.dart';
import '../../shared/components/components.dart';

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
            itemBuilder: (context, index) => buildListProduct(
                cubit.favoritesModel!.data!.data![index].product, context),
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
}
