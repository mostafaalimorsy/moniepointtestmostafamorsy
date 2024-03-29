// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/extensions.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/mainElement/list.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/mainElement/staticPart.dart';

import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/subMainElements/map.dart';
import 'package:moniepointtestmostafamorsy/service/animation/animation.dart';

import '../../../../config/app_export/app_export.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  int pageIndex = 0;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late AnimationController bottomNavAnimationController;

  late Animation<Offset> bottomSlidingAnimation;

  @override
  void initState() {
    initCurvedAnimation();
    initSlidingAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    bottomNavAnimationController.dispose();
    super.dispose();
  }

  void initCurvedAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInCirc);
    animationController.forward();
  }

  void initSlidingAnimation() {
    bottomNavAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    bottomSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(bottomNavAnimationController);
    bottomNavAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBackground(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (widget.pageIndex == 0) homeElement(),
            if (widget.pageIndex == 1) MapScreen(),
            bottomNav(),
          ],
        ),
      ),
    );
  }

  Widget bottomNav() {
    return Positioned.directional(
      bottom: 40.h,
      textDirection: TextDirection.ltr,
      child: BottomAnimation.animationSlidingMethod(
        slidingController: bottomSlidingAnimation,
        widget: AnimatedContainer(
          height: 60.h,
          width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorsManager.black,
          ),
          duration: Duration(seconds: 2),
          child: Padding(
            padding: getPadding(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //search
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      widget.pageIndex = 1;
                    });
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: widget.pageIndex == 1 ? ColorsManager.orange : Colors.black,
                    child: Icon(
                      Icons.search,
                      color: ColorsManager.white,
                    ),
                  ),
                ),
                //chat
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.chat_rounded,
                    color: ColorsManager.white,
                  ),
                ),
                //home
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      widget.pageIndex = 0;
                    });
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: widget.pageIndex == 0 ? ColorsManager.orange : Colors.black,
                    child: Icon(
                      Icons.home_rounded,
                      color: ColorsManager.white,
                    ),
                  ),
                ),
                //fav
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.favorite,
                    color: ColorsManager.white,
                  ),
                ),
                //profile
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homeElement() {
    return SafeArea(
      child: Column(
        children: [
          BottomAnimation.animationFadingMethod(widget: StaticPart(), fadingController: animation),
          ListProduct(),
        ],
      ),
    );
  }
}
