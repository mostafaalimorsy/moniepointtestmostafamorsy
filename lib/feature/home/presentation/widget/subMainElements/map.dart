// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/config/app_export/app_export.dart';
import 'package:moniepointtestmostafamorsy/core/style/textManager.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/extensions.dart';
import 'package:moniepointtestmostafamorsy/service/animation/animation.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});
  bool isAddress = false;
  bool isDialog = false;
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late AnimationController dialogAnimationController;
  late Animation<double> dialogAnimation;

  @override
  void initState() {
    initCurvedAnimation();
    initDialogAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    dialogAnimationController.dispose();
    super.dispose();
  }

  void initCurvedAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInCirc);
    animationController.forward();
  }

  void initDialogAnimation() {
    dialogAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    dialogAnimation = CurvedAnimation(parent: dialogAnimationController, curve: Curves.easeInCirc);
    dialogAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        mapImg(context),
        locations(top: 140.h, left: 80.w),
        locations(top: 200.h, left: 120.w),
        locations(top: 240.h, left: 230.w),
        locations(top: 380.h, left: 60.w),
        locations(top: 320.h, left: 230.w),
        locations(top: 500.h, left: 180.w),
        if (widget.isDialog) dialog(),
        searchBar(),
        listElement(),
        leftIcons(),
      ],
    );
  }

  Widget dialog() {
    return Positioned(
      bottom: 190.h,
      left: 70.w,
      child: BottomAnimation.animationSizeFactorMethod(
        sizeFactorController: dialogAnimation,
        widget: AnimatedContainer(
          width: 170.w,
          height: 150.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
            color: ColorsManager.white,
          ),
          duration: const Duration(seconds: 2),
          curve: Curves.bounceIn,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: getPadding(start: 10.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(vertical: 5.h),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.verified_user_outlined,
                          color: Colors.grey,
                        ),
                        5.hs,
                        AutoSizeText("Cosy areas",
                            style: TextManagerStyle.kTextStyle13(color: Colors.grey, weight: "sb"))
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        widget.isAddress = false;
                        widget.isDialog = !widget.isDialog;
                      });
                    },
                    child: Padding(
                      padding: getPadding(vertical: 5.h, horizontal: 0.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.wallet_rounded,
                            color: widget.isAddress == false ? ColorsManager.orange : Colors.grey,
                          ),
                          5.hs,
                          AutoSizeText("price",
                              style: TextManagerStyle.kTextStyle13(
                                  color: widget.isAddress == false ? ColorsManager.orange : Colors.grey, weight: "sb"))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(vertical: 5.h),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.grey,
                        ),
                        5.hs,
                        AutoSizeText("infrastructure ",
                            style: TextManagerStyle.kTextStyle13(color: Colors.grey, weight: "sb"))
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        widget.isAddress = true;
                        widget.isDialog = !widget.isDialog;
                      });
                    },
                    child: Padding(
                      padding: getPadding(vertical: 5.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.layers,
                            color: widget.isAddress == true ? ColorsManager.orange : Colors.grey,
                          ),
                          5.hs,
                          AutoSizeText("without any layer",
                              style: TextManagerStyle.kTextStyle13(
                                  color: widget.isAddress == true ? ColorsManager.orange : Colors.grey, weight: "sb"))
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget locations({top, left}) {
    return Positioned(
      top: top,
      left: left,
      child: BottomAnimation.animationFadingMethod(
        fadingController: animation,
        widget: AnimatedContainer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: widget.isAddress == true ? 140.w : 40.w,
          height: 40.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: ColorsManager.orange,
          ),
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!widget.isAddress)
                const Icon(
                  Icons.house,
                  color: ColorsManager.white,
                ),
              if (widget.isAddress)
                Expanded(
                  child: Padding(
                    padding: getPadding(start: 5),
                    child: AutoSizeText(
                      "Gladkava St.,25",
                      textAlign: TextAlign.center,
                      style: TextManagerStyle.kTextStyle12(weight: "r", color: ColorsManager.white),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget leftIcons() {
    return Positioned.directional(
      bottom: 120.h,
      start: 20.w,
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              setState(() {
                widget.isDialog = !widget.isDialog;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey[500]!.withOpacity(0.7),
              child: Icon(widget.isAddress == false ? Icons.wallet : Icons.layers, color: ColorsManager.white),
            ),
          ),
          5.vs,
          CircleAvatar(
            backgroundColor: Colors.grey[500]!.withOpacity(0.7),
            child: Transform.rotate(
                angle: 1.0,
                child: const Icon(
                  Icons.arrow_drop_up_rounded,
                  color: ColorsManager.white,
                  size: 40,
                )),
          ),
        ],
      ),
    );
  }

  Widget listElement() {
    return Positioned.directional(
      bottom: 120.h,
      start: 230.w,
      textDirection: TextDirection.ltr,
      child: Container(
        height: 50.h,
        width: 150.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[500]!.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.list, color: ColorsManager.white),
            4.hs,
            AutoSizeText(
              "List of variants",
              style: TextManagerStyle.kTextStyle14(weight: "m", color: ColorsManager.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: getPadding(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: getMargin(all: 15),
            padding: getPadding(start: 10, vertical: 10, end: 90),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.search,
                  color: ColorsManager.black,
                ),
                AutoSizeText(
                  "Saint Petersburg",
                  style: TextManagerStyle.kTextStyle16(weight: "m", color: ColorsManager.black),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            backgroundColor: ColorsManager.white,
            child: Icon(Icons.tune_sharp, size: 20, color: ColorsManager.black),
          )
        ],
      ),
    );
  }

  Widget mapImg(BuildContext context) {
    return Image.asset(
      "assets/img/img/map.jpg",
      height: MediaQuery.sizeOf(context).height,
      fit: BoxFit.cover,
    );
  }
}
