import 'package:flutter/material.dart';
import 'package:moniepointtestmostafamorsy/core/utilites/img/pngManager.dart';

import '../../../../../config/app_export/app_export.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(all: 15),
      child: const CircleAvatar(
        backgroundImage: AssetImage(PNGManager.profile),
      ),
    );
  }
}
