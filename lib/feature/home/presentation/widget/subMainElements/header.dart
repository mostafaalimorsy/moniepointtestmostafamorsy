import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/location.dart';
import 'package:moniepointtestmostafamorsy/feature/home/presentation/widget/pageElements/profileImg.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Location(),
        ProfileImg(),
      ],
    );
  }
}
