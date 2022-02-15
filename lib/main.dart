import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sex_position_generator/const/const.dart';
import 'package:sex_position_generator/widget/display_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/controller.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /* final MainController controller = Get.put(MainController());
  dynamic get startscreen {
    if (controller.box.read('visited') == false) {
      return ChoseNameScreen();
    } else {
      return NameScrean();
    }

  } */

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'You Special',
      home: AnimatedSplashScreen(
        splashIconSize: 300,
        splash: 'assets/hearts_white.gif',
        nextScreen: ChoseNameScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color(0xff000000),
      ),
    );
  }
}

class ChoseNameScreen extends StatelessWidget {
  const ChoseNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(392, 781),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    final mainControler = Get.put(MainController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/Black-Couple.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.only(top: 550.h),
              child: TextField(
                controller: mainControler.nameControler,
                decoration: InputDecoration(hintText: 'Your Love Name'),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                mainControler.box.write('visited', true);
                Get.to(NameScrean());
              },
              child: Text('Start giving love',
                  style:
                      GoogleFonts.pacifico(fontSize: 30, color: Colors.black)),
            ),
          ]), /* add child content here */
        ),
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
    final mainController = Get.find<MainController>();

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
              margin: EdgeInsets.only(top: 150.h),
              alignment: Alignment.topCenter,
              child: AutoSizeText(mainController.nameControler.text,
                  maxLines: 2,
                  style: GoogleFonts.loversQuarrel(
                      fontSize: 100.sp))), /* add child content here */
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
              children: [BluredBox(height: 781.h * 1.04, width: 392.w)],
            ),
          ),
        ),
      ),
    );
  }
}
