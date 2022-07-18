import 'package:flutter/material.dart';

import '../../shared/bloc/cubit/cubit.dart';
import '../../shared/components/components.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade800,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
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
                    const SizedBox(width: 60.0),
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
              height: MediaQuery.of(context).size.height * 1,
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
                    height: 120.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Other Payment Methods',
                      style:
                          TextStyle(fontSize: 21, color: Colors.grey.shade600),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.13,
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
                                onTap: () {},
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
                    height: 160.0,
                    width: 70,
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
                      height: 160.0,
                      width: double.infinity,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width / 1.8,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemCount: 6,
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
