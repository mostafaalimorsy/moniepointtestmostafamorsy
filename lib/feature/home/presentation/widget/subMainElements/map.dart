import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/config/app_export/app_export.dart';
import 'package:moniepointtestmostafamorsy/core/style/textManager.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/extensions.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});
  bool isAddress = false;
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
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
        searchBar(),
        listElement(),
        leftIcons(),
      ],
    );
  }

  Widget locations({top, left}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        //without 40
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.house,
              color: ColorsManager.white,
            ),
            if (widget.isAddress)
              Padding(
                padding: getPadding(start: 5),
                child: AutoSizeText(
                  "Gladkava St.,25",
                  style: TextManagerStyle.kTextStyle12(weight: "r", color: ColorsManager.white),
                ),
              )
          ],
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
          CircleAvatar(
            backgroundColor: Colors.grey[500]!.withOpacity(0.7),
            child: Icon(Icons.layers, color: ColorsManager.white),
          ),
          5.vs,
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              setState(() {
                widget.isAddress = !widget.isAddress;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey[500]!.withOpacity(0.7),
              child: Transform.rotate(
                  angle: 1.0,
                  child: Icon(
                    Icons.arrow_drop_up_rounded,
                    color: ColorsManager.white,
                    size: 40,
                  )),
            ),
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
        height: 40.h,
        width: 150.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[500]!.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list, color: ColorsManager.white),
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
    return Row(
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
        CircleAvatar(
          backgroundColor: ColorsManager.white,
          child: Icon(Icons.tune_sharp, size: 20, color: ColorsManager.black),
        )
      ],
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
