import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zen_app/screens/home_screen.dart';
import 'package:zen_app/screens/signup_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: Colors.green,
      scrollPhysics: BouncingScrollPhysics(),
      pages: [
        PageViewModel(
            titleWidget: Text(
              'title here',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            body:
                'More description of the page.More description of the page.More description of the page.More description of the page.',
            image: Image.asset(
              "assets/images/history.png",
              height: 400,
              width: 400,
            )
            ),
        PageViewModel(
            titleWidget: Text(
              'title here',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            body:
                'More description of the page.More description of the page.More description of the page.More description of the page.',
            image: Image.asset(
              "assets/images/buy.png",
              height: 400,
              width: 400,
            )),
        PageViewModel(
            titleWidget: Text(
              'title here',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            body:
                'More description of the page.More description of the page.More description of the page.More description of the page.',
            image: Image.asset(
              "assets/images/zen.jpeg",
              height: 400,
              width: 400,
            )),
        PageViewModel(
            titleWidget: Text(
              'title here',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            body:
                'More description of the page.More description of the page.More description of the page.More description of the page.',
            image: Image.asset(
              "assets/images/success.png",
              height: 400,
              width: 400,
            )),
      ],
      onDone: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignupScreen()));

       
      },
      onSkip: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignupScreen()));

      },
      showSkipButton: true,
      skip: Text("Skip",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.amber)),
      next: Icon(
        Icons.arrow_forward,
        color: Colors.amber,
      ),
      done: Text("Done",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.amber)),
      dotsDecorator:
          DotsDecorator(size: Size.square(10.0), activeSize: Size(20.0, 10),
          spacing: EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          )),
    ));
  }
}
