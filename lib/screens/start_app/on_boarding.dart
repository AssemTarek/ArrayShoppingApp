import 'package:array_offline_shopping_app/screens/start_app/login.dart';
import 'package:array_offline_shopping_app/shared/local/cash_helper.dart';
import 'package:array_offline_shopping_app/shared/local/components.dart';
import 'package:array_offline_shopping_app/shared/local/styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  var pageController = PageController();
  List<PageItem> pages = [
    PageItem(
        image: "assets/images/onboard_1.jpg", title: "Title 1", body: "Body 1"),
    PageItem(
        image: "assets/images/onboard_1.jpg", title: "Title 2", body: "Body 2"),
    PageItem(
        image: "assets/images/onboard_1.jpg", title: "Title 3", body: "Body 3"),
  ];
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              MyComponent.navigateAndFinish(context, LoginScreen());
            CashHelper.saveData(key: "onBoarding", value:false);
              },
            child: const Text("SKIP",style: TextStyle(
              color: Colors.black,
              fontSize: 15
            ),),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => buildPageItem(pages[index]),
              itemCount: pages.length,
              controller: pageController,
              onPageChanged: (int index) {
                if (index == pages.length - 1) {
                  isLastPage = true;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: pages.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.orange,
                    activeDotColor: Colors.red,
                    spacing: 5,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLastPage) {
                      MyComponent.navigateAndFinish(context, LoginScreen());
                      CashHelper.saveData(key: "onBoarding", value:false);
                    } else {
                      pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageItem(PageItem page) => Column(
        children: [
          Image(
            image: AssetImage(page.image),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            page.title,
            style: MyStyles.titleStyle,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            page.body,
            style: MyStyles.subtitleStyle,
          ),
        ],
      );
}

class PageItem {
  String image = "";
  String title = "";
  String body = "";

  PageItem({
    required this.image,
    required this.title,
    required this.body,
  });
}
