import 'dart:async';
import 'package:duckcart/Pages/login_screen.dart';
import 'package:duckcart/Pages/main_page.dart';
import 'package:duckcart/providers/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/next_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();

    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context,const LoginScreen())
          : nextScreen(context, const MainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade50,
                  ),
                  child: Image.asset(
                    "lib/images/image2.png",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
