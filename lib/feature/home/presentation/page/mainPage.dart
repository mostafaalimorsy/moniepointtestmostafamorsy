// ignore_for_file: prefer_const_constructors, file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/core/style/textManager.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/extensions.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/img/pngManager.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/mainElement/list.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/mainElement/staticPart.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/buyCircle.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/rentSquare.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/subMainElements/header.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/subMainElements/statiticsPart.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/subMainElements/welcomeMsg.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/location.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/profileImg.dart';

import '../../../../config/app_export/app_export.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  int pageIndex = 0;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBackground(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (widget.pageIndex == 0) homeElement(),
            if (widget.pageIndex == 1) searchElement(),
            bottomNav(),
          ],
        ),
      ),
    );
  }

  Widget searchElement() {
    return Text("");
  }

  Widget bottomNav() {
    return Positioned.directional(
      bottom: 40.h,
      textDirection: TextDirection.ltr,
      child: Container(
        height: 60.h,
        width: 300.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorsManager.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                backgroundColor: widget.pageIndex == 1 ? ColorsManager.orange : Colors.black,
                child: Icon(
                  Icons.search,
                  color: ColorsManager.white,
                ),
              ),
            ),
            //chat
            CircleAvatar(
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
                backgroundColor: widget.pageIndex == 0 ? ColorsManager.orange : Colors.black,
                child: Icon(
                  Icons.home_rounded,
                  color: ColorsManager.white,
                ),
              ),
            ),
            //fav
            CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.favorite,
                color: ColorsManager.white,
              ),
            ),
            //profile
            CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.person,
                color: ColorsManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget homeElement() {
    return Column(
      children: const [
        StaticPart(),
        ListProduct(),
      ],
    );
  }
}
