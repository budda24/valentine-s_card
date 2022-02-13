import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/const.dart';
import '../models/graphics.dart';

class BluredBox extends StatefulWidget {
  const BluredBox({Key? key, required this.height, required this.width})
      : super(key: key);
  final double width;
  final double height;

  @override
  _BluredBoxState createState() => _BluredBoxState();
}

class _BluredBoxState extends State<BluredBox> {
  /*accesing the list of grapic in Position*/
  PositionGrapics positionInstance = PositionGrapics();
  String graphicPath = PositionGrapics.graphicList[0].path;
  String title = PositionGrapics.graphicList[0].title;

  Set<int> setOfGeneratedNumber = {};
  bool isAded = true;
  int index = 0;

  void randomNumber() async {
    /*loop to genrate always unique*/
    while (true) {
      /*from 0 to 20 = 21 elements */
      index = Random().nextInt(PositionGrapics.graphicList.length);

      /*returns false when there is coresponding elemet in set*/
      if (setOfGeneratedNumber.add(index))
        break;
      else if (setOfGeneratedNumber.length ==
          PositionGrapics.graphicList.length) {
        /*clening the set when all graphic displayed*/
        setOfGeneratedNumber = {};
        break;
        /*omiting the iteration where graphic was displayed*/
      } else
        continue;
    }

    graphicPath = PositionGrapics.graphicList[index].path;
    title = PositionGrapics.graphicList[index].title;

    setState(() {
      graphicPath;
      title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: -40,
      child: Container(
        margin: EdgeInsets.only(top: widget.height * 0.30),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          width: widget.width * 1,
                          height: widget.height * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(widget.height * 0.02)),
                              color: Colors.white.withOpacity(0.1)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 95.w,
                      top: 50,
                      child: Container(
                        height: 200.h,
                        width: 200.w,
                        child: CachedNetworkImage(
                          imageUrl: graphicPath,
                          placeholder: (context, url) => Center(
                            child: Image.asset('assets/hearts_white.gif'),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 250.h,
                      left: 45.w,
                      child: Container(
                        width: 300.w,
                        height: 300.h,
                        child: Text(title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.pacifico(fontSize: 30.sp)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: widget.height * 0.62, left: widget.width * 0.28),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          stops: [
                            0.10,
                            0.90,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffFF5984),
                            Color(0xffFF9BBF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: randomNumber,
                        child: Text('More love',
                            style: GoogleFonts.pacifico(
                                fontSize: 30, color: Colors.black)),
                      ),
                    ),
                    /* ), */
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
