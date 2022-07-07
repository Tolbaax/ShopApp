import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/bloc/cubit/cubit.dart';
import 'package:shop_app/shared/bloc/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../shared/styles/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
            title: const Center(
              child: Text(
                'Cart',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            actions: [
              deleteButton(context),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => cartItemBuilder(context),
                  itemCount: 2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.101,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 20.0, end: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount Price',
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 17.0),
                          ),
                          const Spacer(),
                          richText(
                            text: '520',
                            size: 30.0,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.101,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                            color: defaultColor,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              'Check Out',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            CircleAvatar(
                              radius: 14.0,
                              child: Text(
                                '4',
                                style: TextStyle(
                                  color: defaultColor,
                                ),
                              ),
                              backgroundColor: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget cartItemBuilder(context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 20.0, end: 20.0, top: 30.0, bottom: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.grey.shade600,
                size: 20,
              ),
              const SizedBox(
                width: 5.0,
              ),
              const Text(
                'Scarlet',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.26,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://student.valuxapps.com/storage/uploads/products/1615440689Oojt6.item_XXL_36330138_142814947.jpeg',
                        ),
                      )),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Scarlett Whitening',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      richText(text: '520'),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.07,
                      decoration: BoxDecoration(
                        color: defaultColor.shade200,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: defaultColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.07,
                      decoration: BoxDecoration(
                        color: defaultColor.shade200,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20.0,
                      ),
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
