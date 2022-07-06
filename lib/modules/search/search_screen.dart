import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/cubit/cubit.dart';
import 'package:shop_app/modules/search/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SearchCubit searchCubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
              title: const Center(
                child: Text('Search New Products..'),
              ),
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsetsDirectional.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          'Please Enter Text To Search';
                        }
                        return null;
                      },
                      onSubmit: (text) {
                        SearchCubit.get(context).search(text: text.toString());
                        return null;
                      },
                      prefix: Icons.search,
                      suffix:
                          searchController.text.isNotEmpty ? Icons.clear : null,
                      suffixTab: () {
                        searchController.clear();
                      },
                      label: 'Search',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => buildListProduct(
                            searchCubit.searchModel!.data.data[index],
                            context,
                            isOldPrice: false,
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: searchCubit.searchModel!.data.data.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
