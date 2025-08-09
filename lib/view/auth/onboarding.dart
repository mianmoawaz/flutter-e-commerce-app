import 'package:flutter/material.dart';
import 'package:flutter_e_commece_app/view/auth/sigin_in_with_google.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "High Quality Products",
          body: "We provide high quality products just for you",
          image: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset('assets/Armchair_PNG_Clip_Art_Image 1.png',
                height: 300),
          ),
          footer: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                introKey.currentState?.next();
              },
            ),
          ),
        ),
        PageViewModel(
          title: "Your Satisfaction",
          body: "Your satisfaction is our number one priority",
          image: Image.asset('assets/Modern-Chair-PNG-HD-Quality 1.png',
              height: 200),
          footer: ElevatedButton(
            child: Text("Next"),
            onPressed: () {
              introKey.currentState?.next();
            },
          ),
        ),
        PageViewModel(
          title: "Daily Needs",
          body: "Let’s fulfill your daily needs with us",
          image: Image.asset('assets/Modern-Chair-PNG-HD-Quality 1.png',
              height: 200),
          footer: ElevatedButton(
            child: Text("Get Started"),
            onPressed: () {
              Get.to(() => SiginInWithGoogle());
            },
          ),
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showNextButton: false,
      dotsDecorator: DotsDecorator(activeColor: Colors.deepPurple),
    );
  }
}
