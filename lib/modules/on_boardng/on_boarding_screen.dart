import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/board_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();
  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndRemoveUntil(context, LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'SKIP',
                style: TextStyle(
                    fontSize: 20,
                    color: defaultColor.shade600,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.675,
              child: PageView.builder(
                itemBuilder: (context, index) => buildPageView(boarding[index]),
                physics: const BouncingScrollPhysics(),
                itemCount: boarding.length,
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    isLast = false;
                  }
                },
              ),
            ),
            SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                activeDotColor: defaultColor,
                expansionFactor: 4,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 6.0,
              ),
              controller: boardController,
              count: boarding.length,
            ),
            const Spacer(),
            Container(
              height: screenSize.height * 0.076,
              width: screenSize.width * 0.53,
              decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(15.0)),
              child: TextButton(
                onPressed: () {
                  isLast
                      ? submit()
                      : boardController.nextPage(
                          duration: const Duration(microseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                },
                child: Text(
                  isLast ? 'GET STARTED' : 'SKIP',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageView(BoardingModel model) => Column(
        children: [
          Image(image: AssetImage(model.image)),
          const SizedBox(
            height: 50.0,
          ),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 37.0,
              fontWeight: FontWeight.w500,
              color: defaultColor.shade900,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            model.body,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: defaultColor.shade900,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
