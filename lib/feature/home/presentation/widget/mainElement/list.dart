import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/config/app_export/app_export.dart';
import 'package:moniepointtestmostafamorsy/core/style/textManager.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/extensions.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/img/pngManager.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/subMainElements/statiticsPart.dart';
import 'package:moniepointtestmostafamorsy/service/animation/animation.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);
  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController buttonAnimationController;
  late Animation<double> animation;
  late AnimationController listAnimationController;

  late Animation<double> listAnimation;
  late Animation<Offset> bottomSlidingAnimation;

  @override
  void initState() {
    initCurvedAnimation();
    initSlidingAnimation();
    initSizeFactorAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    buttonAnimationController.dispose();
    listAnimationController.dispose();
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
    buttonAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2200),
    );
    bottomSlidingAnimation = Tween<Offset>(begin: Offset(-7, 0), end: Offset.zero).animate(buttonAnimationController);
    buttonAnimationController.forward();
  }

  void initSizeFactorAnimation() {
    listAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2200),
    );
    listAnimation = Tween<double>(begin: 100, end: 0).animate(listAnimationController);
    listAnimation = CurvedAnimation(parent: listAnimationController, curve: Curves.linear);

    listAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 252,
      child: ListView(
        shrinkWrap: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Column(
            children: [
              const StatiticsPart(),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: ColorsManager.white,
                ),
                // duration: Duration(seconds: 1),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: getPadding(horizontal: 15, vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(PNGManager.room2),
                          ),
                        ),
                        Positioned(
                          bottom: 20.h,
                          // textDirection: TextDirection.ltr,
                          // duration: Duration(seconds: 1),

                          child: BottomAnimation.animationSizeMethod(
                            sizeFactorController: listAnimation,
                            widget: Container(
                              // duration: Duration(seconds: 1),
                              height: 50.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300]!.withOpacity(0.7),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: getPadding(start: 90.w),
                                    child: AutoSizeText(
                                      "Gladkava St.,25",
                                      style: TextManagerStyle.kTextStyle14(weight: "m", color: ColorsManager.black),
                                    ),
                                  ),
                                  const Spacer(),
                                  BottomAnimation.animationSlidingMethod(
                                    slidingController: bottomSlidingAnimation,
                                    widget: const CircleAvatar(
                                      backgroundColor: ColorsManager.white,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: ColorsManager.grey,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                  5.hs,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: getPadding(horizontal: 15, vertical: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  PNGManager.room2,
                                  width: 166.w,
                                  height: 200.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned.directional(
                              bottom: 20.h,
                              textDirection: TextDirection.ltr,
                              child: BottomAnimation.animationSizeMethod(
                                sizeFactorController: listAnimation,
                                widget: Container(
                                  height: 50.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300]!.withOpacity(0.7),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: getPadding(start: 10.w),
                                        child: AutoSizeText(
                                          "Gladkava St.,25",
                                          style: TextManagerStyle.kTextStyle12(weight: "m", color: ColorsManager.black),
                                        ),
                                      ),
                                      const Spacer(),
                                      BottomAnimation.animationSlidingMethod(
                                        slidingController: bottomSlidingAnimation,
                                        widget: CircleAvatar(
                                          backgroundColor: ColorsManager.white,
                                          child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: ColorsManager.grey,
                                            size: 10,
                                          ),
                                        ),
                                      ),
                                      2.hs
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: getPadding(horizontal: 15, vertical: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  PNGManager.room2,
                                  width: 166.w,
                                  height: 200.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned.directional(
                              bottom: 20.h,
                              textDirection: TextDirection.ltr,
                              child: BottomAnimation.animationSizeMethod(
                                sizeFactorController: listAnimation,
                                widget: Container(
                                  height: 50.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300]!.withOpacity(0.7),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: getPadding(start: 10.w),
                                        child: AutoSizeText(
                                          "Gladkava St.,25",
                                          style: TextManagerStyle.kTextStyle12(weight: "m", color: ColorsManager.black),
                                        ),
                                      ),
                                      const Spacer(),
                                      BottomAnimation.animationSlidingMethod(
                                        slidingController: bottomSlidingAnimation,
                                        widget: CircleAvatar(
                                          backgroundColor: ColorsManager.white,
                                          child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: ColorsManager.grey,
                                            size: 10,
                                          ),
                                        ),
                                      ),
                                      2.hs
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: getPadding(horizontal: 15, vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(PNGManager.room2),
                          ),
                        ),
                        Positioned.directional(
                          bottom: 20.h,
                          textDirection: TextDirection.ltr,
                          child: BottomAnimation.animationSizeMethod(
                            sizeFactorController: listAnimation,
                            widget: Container(
                              height: 50.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300]!.withOpacity(0.7),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: getPadding(start: 90.w),
                                    child: AutoSizeText(
                                      "Gladkava St.,25",
                                      style: TextManagerStyle.kTextStyle14(weight: "m", color: ColorsManager.black),
                                    ),
                                  ),
                                  const Spacer(),
                                  BottomAnimation.animationSlidingMethod(
                                    slidingController: bottomSlidingAnimation,
                                    widget: CircleAvatar(
                                      backgroundColor: ColorsManager.white,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: ColorsManager.grey,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                  10.hs
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    20.vs
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
