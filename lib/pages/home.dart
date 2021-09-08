import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 38,
                bottom: 57,
              ),
              child: Image(
                image: AssetImage("assets/images/Group 186.png"),
                height: 290,
                width: 290,
              ),
            ),
            Text(
              "STAY ORGANIZED",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 106,
              ),
              child: Container(
                width: 233,
                child: Center(
                  child: Text(
                    "Keep all documents and recordings in one system",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.83,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.off(() => SplashScreen());
              },
              child: Container(
                width: 196,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff6DA7FE),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.15),
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koachme/Pages/Onboarding/Constant.dart';
import 'package:koachme/Pages/Login/LoginGoogle.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = "/onBoarding";
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _pageController = PageController();
  double currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;

    // Attach a listener which will update the state and refresh the page index
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: Get.width,
              height: Get.height,
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, position) {
                  return PageViewModel(
                    imgName: "Onboarding${position + 1}",
                    title: titles[position],
                    subTitle: subTitles[position],
                  );
                },
                itemCount: titles.length, // Can be null
              )),
          Container(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: DotsIndicator(
                    dotsCount: 4,
                    position: currentIndex,
                    decorator: DotsDecorator(
                      size: Size(8, 8),
                      color:
                          Color(0xff6C6E75).withOpacity(0.2), // Inactive color
                      activeColor: Color(0xff193591),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 82),
                  child: GestureDetector(
                    onTap: () {
                      print(currentIndex);
                      if(currentIndex==3)
                      {
                        Get.offAllNamed(UserLogin.routeName);
                      }
                      _pageController.animateToPage(
                        currentIndex.round() == 3
                            ? 3
                            : currentIndex.round() + 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      height: 58,
                      width: 58,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff1C2445).withOpacity(0.16),
                              offset: Offset(0, 8),
                              blurRadius: 34,
                              spreadRadius: -4,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color(
                          0xff193591,
                        ),
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class PageViewModel extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imgName;

  const PageViewModel(
      {Key key,
      @required this.title,
      @required this.subTitle,
      @required this.imgName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 45, right: 45, top: 130, bottom: 50),
            child:
                Image(image: AssetImage("assets/Images/Graphics/$imgName.png")),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w600,
              color: Color(0xff1C2445),
              fontFamily: "SF Pro Display",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 45,
              right: 45,
            ),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff6C6E75),
                  fontFamily: "SF Pro Text"),
            ),
          ),
        ],
      ),
    );
  }
}
*/