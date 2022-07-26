import 'package:flutter/material.dart';
import 'package:shop_app/models/payment_model.dart';
import 'package:shop_app/modules/payment/payment_details_screen.dart';

import '../../shared/bloc/cubit/cubit.dart';
import '../../shared/components/components.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Colors.blueGrey.shade800,
              height: screenSize.height * 0.3,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 15, start: 10, end: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 85.0),
                    const Text(
                      'Payment Methods',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: screenSize.height * 1,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
              margin: const EdgeInsetsDirectional.only(top: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 15.0,
                    ),
                    child: Text(
                      'Other Payment Methods',
                      style:
                          TextStyle(fontSize: 22, color: Colors.grey.shade600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 65.0),
                    child: SizedBox(
                      height: screenSize.height * 0.355,
                      width: screenSize.width * 0.9,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
                                  height: 35.0,
                                  width: 35.0,
                                  child: Image(
                                    image: NetworkImage(
                                      '${paymentList[index].imageUrl}',
                                    ),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${paymentList[index].name}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20.0),
                        itemCount: paymentList.length,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: screenSize.height * 0.13,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(35.0),
                          topLeft: Radius.circular(35.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Pay',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              richText(
                                text:
                                    '${ShopCubit.get(context).cartModel!.data!.total.toStringAsFixed(0)}',
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  navigateTo(
                                      context, const PaymentDetailsScreen());
                                },
                                child: const Text(
                                  'View Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: screenSize.height * 0.22,
                    width: screenSize.width * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade700,
                          offset: Offset.zero,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: screenSize.height * 0.22,
                      width: double.infinity,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              width: screenSize.width / 1.8,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        '${paymentCategory[index].imageUrl}',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemCount: paymentCategory.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
