import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/buyCircle.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/rentSquare.dart';
import 'package:moniepointtestmostafamorsy/service/animation/animation.dart';

class StatiticsPart extends StatefulWidget {
  const StatiticsPart({Key? key}) : super(key: key);
  @override
  State<StatiticsPart> createState() => _StatiticsPartState();
}

class _StatiticsPartState extends State<StatiticsPart> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    initCurvedAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BottomAnimation.animationFadingMethod(
        fadingController: animation,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuyWidget(),
            RentWidget(),
          ],
        ),
      ),
    );
  }
}
