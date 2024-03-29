// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';

class BottomAnimation {
// ******************************************************** Controllers ***************************************************** //

/*
*  controllers:
  late AnimationController animationController;
  *sliding:
  late Animation<Offset> bottomSlidingAnimation;
  *fading & size  factor:
  late Animation<double> animation;


 */

// ************************************************** initialize Functions ************************************************** //

////*initialize fading & size  factor animation func
  static void initCurvedAnimation({animationController, animation, vsyncThis}) {
    animationController = AnimationController(
      vsync: vsyncThis,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInCirc);
    animationController.forward();
  }
// //*initialize sliding animation func

  static void initSlidingAnimation({slidingAnimation, animationController, vsyncThis}) {
    animationController = AnimationController(
      vsync: vsyncThis,
      duration: Duration(milliseconds: 2200),
    );
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(animationController);
    animationController.forward();
  }
// ************************************************** Animation Functions ************************************************** //

  //* sliding Transaction Animation for elements
  static Widget animationSlidingMethod({widget, slidingController}) {
    return AnimatedBuilder(
      animation: slidingController,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: slidingController,
          child: widget,
        );
      },
    );
  }

  //* fading Transaction Animation for elements
  static Widget animationFadingMethod({widget, fadingController}) {
    return AnimatedBuilder(
      animation: fadingController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          alwaysIncludeSemantics: true,
          opacity: fadingController,
          child: widget,
        );
      },
    );
  }

  //* size factor Transaction Animation for elements
  static Widget animationSizeFactorMethod({widget, sizeFactorController}) {
    return AnimatedBuilder(
      animation: sizeFactorController,
      builder: (BuildContext context, _) {
        return SizeTransition(
          sizeFactor: sizeFactorController,
          child: widget,
        );
      },
    );
  }
  //* size factor Transaction from left to rifht Animation for elements

  static Widget animationSizeMethod({widget, sizeFactorController}) {
    return AnimatedBuilder(
      animation: sizeFactorController,
      builder: (BuildContext context, _) {
        return SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: sizeFactorController,
          child: widget,
        );
      },
    );
  }
}
