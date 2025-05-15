import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 시작 화면
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/main");
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/business-card.png", width: 200, height: 200),
            Container(
              margin: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
              child: Text(
                "나의 명함 앱",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
