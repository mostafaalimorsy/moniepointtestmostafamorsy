import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/buyCircle.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/rentSquare.dart';

class StatiticsPart extends StatefulWidget {
  const StatiticsPart({Key? key}) : super(key: key);
  @override
  State<StatiticsPart> createState() => _StatiticsPartState();
}

class _StatiticsPartState extends State<StatiticsPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuyWidget(),
          RentWidget(),
        ],
      ),
    );
  }
}
