import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sex_position_generator/const/const.dart';
import 'package:sex_position_generator/widget/display_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'You Special',
      home: AnimatedSplashScreen(
        splashIconSize: 300,
        splash: 'assets/hearts_white.gif',
        nextScreen: NameScrean(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color(0xff000000),
      ),
    );
  }
}

class NameScrean extends StatelessWidget {
  /* const NameScrean({Key? key}) : super(key: key); */
  void nextScrean() async {
    await Future.delayed(Duration(seconds: 2));
    Get.to(MyHomePage());
  }

  @override
  Widget build(BuildContext context) {
    nextScrean();
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(392, 781),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/name-screan-bc.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 180.h),
            alignment: Alignment.topCenter,
            child: Text('Nunlaya',
                style: GoogleFonts.loversQuarrel(fontSize: 100.h)),
          ), /* add child content here */
        ),
      ),
    );
    /* Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Image.network('https://dsm01pap004files.storage.live.com/y4mOXX7-a4lldKKh2bF64cJmKiy4Dyl9F61g2_0EFq18RLZ-yHhGeLjpDkXdtggOXzYV5aUCdh56mMzK5rz6AZbY9V3FEb0Oiqs0Q5_i8Jn-T61m8E9PF2_6wmKiE1chFhxjT29HUSucw3U-bOZ6xHd2GCYSwqiPcLtBduPfyLUunITBbH_-HfLUeiCShjfLFlT?width=375&height=812&cropmode=none').color,
    );
  } */
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              'assets/angel.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            top: false,
            child: Stack(
              children: [
                BluredBox(height: 781.h * 1.04, width: 392.w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
