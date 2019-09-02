import 'package:flutter/material.dart';
import 'package:night_sky/girl.dart';
import 'package:night_sky/planets.dart';
import 'package:night_sky/shooting_star.dart';
import 'package:night_sky/sky.dart';
import 'package:night_sky/star.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController bobAnimationController, slowAnimationController, mdSpeedAnimationController, fastAnimationController;
  Animation<double> starAnimation;

  @override
  initState() {
    super.initState();
    bobAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    slowAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 6000),
      vsync: this,
    );
    mdSpeedAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    fastAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    startBobAnimation();
    slowAnimationController.repeat().orCancel;
    mdSpeedAnimationController.repeat().orCancel;
    fastAnimationController.repeat().orCancel;
  }

  startBobAnimation() {
    var animation = new Tween(begin: 0.0, end: 50.0).animate(bobAnimationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bobAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        bobAnimationController.forward();
      }
    });
    bobAnimationController.forward();
  }

  @override
  dispose() {
    slowAnimationController?.dispose();
    mdSpeedAnimationController?.dispose();
    fastAnimationController?.dispose();
    bobAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new SkyCircle(
              size: 250.0,
              top: -30.0,
              left: -30.0,
              radius: 120.0,
              animationController: mdSpeedAnimationController,),
            new SkyCircle(
                size: 250.0,
                top: -30.0,
                left: 150.0,
                radius: 120.0,
                animationController: mdSpeedAnimationController),
            new SkyCircle(
                size: 220.0,
                top: 160.0,
                left: 10.0,
                radius: 107.0,
                animationController: mdSpeedAnimationController),
            new SkyCircle(
                size: 220.0,
                top: 160.0,
                left: 140.0,
                radius: 107.0,
                animationController: mdSpeedAnimationController),
            new SkyCircle(
                size: 170.0,
                top: 340.0,
                left: 40.0,
                radius: 81.0,
                animationController: mdSpeedAnimationController),
            new SkyCircle(
                size: 170.0,
                top: 340.0,
                left: 140.0,
                radius: 81.0,
                animationController: mdSpeedAnimationController),
            new SkyPoint(size: 180.0, top: 500.0, left: 125.0),
            new Star(top: 150.0, left: 150.0),
            new Star(top: 10.0, left: 10.0),
            new Star(top: 83.0, left: 303.0),
            new Star(top: 287.0, left: 287.0),
            new Star(top: 367.0, left: 100.0),
            new Star(top: 447.0, left: 240.0),
            new Star(top: 302.0, left: 160.0),
            new Star(top: 165.0, left: 60.0),
            new Star(top: 468.0, left: 60.0),
            new Star(top: 538.0, left: 150.0),
            new ShootingStar(
              top: 280.0,
              left: 10.0,
              animationStep: new CurvedAnimation(
                parent: mdSpeedAnimationController,
                curve: new Interval(0.0, 0.3),
              ),
            ),
            new ShootingStar(
              top: 100.0,
              left: 10.0,
              animationStep: new CurvedAnimation(
                parent: mdSpeedAnimationController,
                curve: new Interval(0.3, 0.7),
              ),
            ),
            new ShootingStar(
              top: 470.0,
              left: 59.0,
              width: 372.0,
              animationStep: new CurvedAnimation(
                parent: mdSpeedAnimationController,
                curve: new Interval(0.4, 0.6),
              ),
            ),
            new Planet(
              size: 50.0,
              top: 40.0,
              left: 60.0,
              animationController: fastAnimationController,
              pivotAlignment: FractionalOffset.center,
              gradient: new LinearGradient(
                  colors: [new Color(0xFF00c6fb), new Color(0xFF005bea)]),
            ),
            // Top Right Orange/Yellow
            new Planet(
              size: 45.0,
              top: 150.0,
              left: 250.0,
              pivotAlignment: FractionalOffset.centerLeft,
              animationController: slowAnimationController,
              gradient: new LinearGradient(
                  colors: [new Color(0xFFf83600), new Color(0xFFf9d423)]),
            ),
            // Pink with Rings / Left
            new Planet(
              size: 65.0,
              top: 245.0,
              left: 45.0,
              pivotAlignment: FractionalOffset.center,
              animationController: bobAnimationController,
              ringWidth: 10.0,
              color: new Color(0xFFff0844),
              gradient: new LinearGradient(
                  colors: [new Color(0xFFff0844), new Color(0xFFffb199)]),
            ),
            //Purple - bottom left
            new Planet(
              reverse: true,
              size: 65.0,
              top: 365.0,
              left: 115.0,
              pivotAlignment: FractionalOffset.centerRight,
              animationController: mdSpeedAnimationController,
              color: new Color(0xFFff0844),
              gradient: new LinearGradient(
                  colors: [new Color(0xFFcc208e), new Color(0xFF6713d2)]),
            ),
            new Arm(size: 100.0, top: 655.0, left: 233.0, rotate: 35.0),
            new Body(size: 180.0, top: 640.0, left: 235.0),
            new Leg(
                height: 80.0,
                width: 60.0,
                top: 688.0,
                left: 218.0,
                rotate: -33.0),
            new Shoe(size: 30.0, top: 740.0, left: 250.0, rotate: -24.0),
            new Toe(size: 35.0, top: 737.0, left: 247.0, rotate: 0.0),
            new Pants(size: 60.0, top: 723.0, left: 266.0),
            new Hair(size: 120.0, top: 630.0, left: 215.0),
            new Head(size: 70.0, top: 620.0, left: 190.0),
            new Pencil(size: 60.0, top: 695.0, left: 176.0, rotate: -15.0),
          ],
        )
      )
    );
  }
}