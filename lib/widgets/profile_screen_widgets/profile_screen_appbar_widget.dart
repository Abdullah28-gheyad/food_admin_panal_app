import 'package:flutter/material.dart';
import 'package:foodappadminpanal/styles/colors.dart';

class ProfileScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ProfileScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      elevation: 0,
      title: Text('My Profiel'),
    ) ;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity , 60) ;
}
