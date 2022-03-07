import 'package:flutter/material.dart';

import 'body_widget.dart';
import 'circle_avatar_position_stack.dart';
import 'first_postition_stack_widget.dart';

class ProfileStackWidget extends StatelessWidget {
  const ProfileStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionOneStack() ,
        ProfileBodyWidget() ,
        CircleAvatarStack()
      ],
    );
  }
}
