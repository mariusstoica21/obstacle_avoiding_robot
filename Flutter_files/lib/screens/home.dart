import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//double sliderValue = 128;
double angleValue = 0;
double speedValue = 2.0;
double servoValue = 128;
bool speedWidget = true;
int distance = -1;
int speed = -1;
int angle = -1;
double min = 0;
double max = 100;



double maxValue = 5.0;
double progress = 1.0;

final dbRef = FirebaseDatabase.instance.reference();


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    dbRef.child("Distance").set({"value":0});
    dbRef.child("Speed").set({"value":0});

    maxValue = maxValue >0?maxValue:0;
    progress = maxValue>progress?progress:maxValue;

    return Scaffold(
      body : StreamBuilder(
        stream: dbRef.onValue,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return SafeArea(
            child: Material(
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Container(
                      //color: Color.fromARGB(209, 21, 130, 231),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Positioned(
                    left: 15.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 34.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 162.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 114.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Container(
                      //color : Color.fromARGB(89, 196, 196, 196),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(89, 196, 196, 196),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 183.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 34.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 162.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 114.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Container(
                      //color : Color.fromARGB(89, 196, 196, 196),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(89, 196, 196, 196),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 26.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 43.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 71.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 28.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Text
                      (
                        'Distance',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 21, 130, 231),
                            ))
                    ),
                  ),
                  Positioned(
                    left: 188.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 43.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 63.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 28.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Text
                      (
                        'Speed',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 21, 130, 231),
                            ))
                    ),
                  ),
                  Positioned(
                    left: 19.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 70.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 84.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 40.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Text
                      (
                        readDistance(),
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 21, 130, 231),
                            ))
                    ),
                  ),
                  Positioned(
                    left: 177.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 70.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 84.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 40.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Text
                      (
                        readSpeed(),
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 21, 130, 231),
                            ))
                    ),
                  ),
                  Positioned(
                    left: 18.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 118.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 84.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 27.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Text
                      (
                        'centimeters',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 21, 130, 231),
                            ))
                    ),
                  ),
                  Positioned(
                    left: 177.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 118.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 84.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 27.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Text
                      (
                        'cm/s',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 21, 130, 231),
                            ))
                    ),
                  ),
                  Positioned(
                    left: 113.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 65.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    child: SvgPicture.asset(
                      //<a href="https://www.flaticon.com/free-icons/centimeter" title="centimeter icons">Centimeter icons created by Freepik - Flaticon</a>
                      'img/centimeter.svg',
                      width: 64.0 * MediaQuery
                          .of(context)
                          .size
                          .width / 360,
                      height: 47.0 * MediaQuery
                          .of(context)
                          .size
                          .height / 640,
                    ),
                  ),
                  Positioned(
                    left: 275.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 65.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    child: SvgPicture.asset(
                      //<a href="https://www.flaticon.com/free-icons/performance" title="performance icons">Performance icons created by Freepik - Flaticon</a>
                      'img/speedometer.svg',
                      width: 43.0 * MediaQuery
                          .of(context)
                          .size
                          .width / 360,
                      height: 53.0 * MediaQuery
                          .of(context)
                          .size
                          .height / 640,
                    ),
                  ),
                  Positioned(
                      left: 30.0 * MediaQuery
                          .of(context)
                          .size
                          .width / 360,
                      top: 169.0 * MediaQuery
                          .of(context)
                          .size
                          .height / 640,
                      right: null,
                      bottom: null,
                      width: 54.0 * MediaQuery
                          .of(context)
                          .size
                          .width / 360,
                      height: 28.0 * MediaQuery
                          .of(context)
                          .size
                          .height / 640,
                      child:  Text
                      (
                      'Angle',
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 21, 130, 231),
                          ),
                      )
                  ),
                  ),
                  Positioned(
                    left: 220.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 169.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 100.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 28.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child:  Text
                      (
                        'Speed selection',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 21, 130, 231),
                          ),
                        )
                    ),
                  ),
                  Positioned(
                    left: 87.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 166.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 41.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    height: 27.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Container(
                      //color : Color.fromARGB(89, 196, 196, 196),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 190.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 220.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    child: Slider(
                      value: progress,
                      max: maxValue,
                      label: progress.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          progress = value;
                          writeSpeed(progress.toInt());
                        });
                      },
                      divisions: 5,
                    ),
                  ),
                  Positioned(
                    left: 30.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 206.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    // width: 230.0 * MediaQuery
                    //     .of(context)
                    //     .size
                    //     .width / 360,
                    // height: 32.0 * MediaQuery
                    //     .of(context)
                    //     .size
                    //     .height / 640,
                    child:
                    SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          customColors : CustomSliderColors(
                            trackColor: Color.fromARGB(255, 21, 130, 231),
                            progressBarColor: Color.fromARGB(255, 21, 130, 231),
                          ),
                          infoProperties: InfoProperties(
                            modifier: (double value) {
                              final roundedValue = value.ceil().toInt().toString();
                              return '$roundedValue°';
                            },
                          ),
                        ),
                        min: 0,
                        max: 180,
                        initialValue: 0,
                        onChange: (double value) {
                          setState(() {
                                angleValue = value;
                                writeAngle(angleValue.ceil().toDouble().toInt());
                              });
                          print(angleValue.ceil().toDouble().toInt());
                        }),
                  ),
                  Positioned(
                    left: 80 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 385 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    width: 200.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    //width : 330,
                    //height : 218,
                    height: 195.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    child: Container(
                      //color: Color.fromARGB(255, 21, 130, 231),
                      decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 21, 130, 231),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 156.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 403.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        writeDirection("up");
                      }, // handle your image tap here
                      child: SvgPicture.asset(
                        //<a href="https://www.flaticon.com/free-icons/arrow" title="arrow icons">Arrow icons created by Freepik - Flaticon</a>
                        'img/up.svg',
                        width: 48.0 * MediaQuery
                            .of(context)
                            .size
                            .width / 360,
                        height: 31.0 * MediaQuery
                            .of(context)
                            .size
                            .height / 640,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 232.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 459.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        writeDirection("right");
                      }, // handle your image tap here
                      child: SvgPicture.asset(
                        //<a href="https://www.flaticon.com/free-icons/arrow" title="arrow icons">Arrow icons created by Freepik - Flaticon</a>
                        'img/right.svg',
                        width: 30.0 * MediaQuery
                            .of(context)
                            .size
                            .width / 360,
                        height: 48.0 * MediaQuery
                            .of(context)
                            .size
                            .height / 640,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 156.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 531.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        writeDirection("down");
                      }, // handle your image tap here
                      child: SvgPicture.asset(
                         //<a href="https://www.flaticon.com/free-icons/arrow" title="arrow icons">Arrow icons created by Freepik - Flaticon</a>
                        'img/down.svg',
                        width: 48.0 * MediaQuery
                            .of(context)
                            .size
                            .width / 360,
                        height: 31.0 * MediaQuery
                            .of(context)
                            .size
                            .height / 640,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 98.0 * MediaQuery
                        .of(context)
                        .size
                        .width / 360,
                    top: 459.0 * MediaQuery
                        .of(context)
                        .size
                        .height / 640,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        writeDirection("left");
                      }, // handle your image tap here
                      child: SvgPicture.asset(
                        //<a href="https://www.flaticon.com/free-icons/arrow" title="arrow icons">Arrow icons created by Freepik - Flaticon</a>
                        'img/left.svg',
                        width: 30.0 * MediaQuery
                            .of(context)
                            .size
                            .width / 360,
                        height: 48.0 * MediaQuery
                            .of(context)
                            .size
                            .height / 640,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> writeDirection(String direction)async {
    dbRef.child("Direction").set({"dir":direction});
  }

  Future<void> writeSpeed(int speed)async {
    dbRef.child("SpeedSel").set({"value":speed});
  }

  Future<void> writeAngle(int angle)async {
    dbRef.child("AngleVal").set({"value":angle});
  }


  String readDistance(){
    dbRef.child("Distance").child("value").onValue.listen((event) {
      final int description = event.snapshot.value;
      distance = description;
      //print(description.toString());
    });
    print(distance);
    return distance.toString();
  }

  String readSpeed(){
    dbRef.child("Speed").child("value").onValue.listen((event) {
      final int description = event.snapshot.value;
      speed = description;
      //print(description.toString());
    });
    print(speed);
    return speed.toString();
  }


}
