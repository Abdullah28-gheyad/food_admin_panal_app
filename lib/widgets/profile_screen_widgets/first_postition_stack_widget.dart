import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class PositionOneStack extends StatelessWidget {
  const PositionOneStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 150,
        color: AppColor.primaryColor,
      ),
    );
  }
}
