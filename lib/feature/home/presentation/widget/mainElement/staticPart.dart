import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/subMainElements/header.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/subMainElements/welcomeMsg.dart';

class StaticPart extends StatefulWidget {
  const StaticPart({Key? key}) : super(key: key);
  @override
  State<StaticPart> createState() => _StaticPartState();
}

class _StaticPartState extends State<StaticPart> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //location and profile image
        Header(),
        // welcome msg
        WelcomeMsg(),
      ],
    );
  }
}
