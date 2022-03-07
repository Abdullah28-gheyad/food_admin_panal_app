import 'package:flutter/material.dart';
import 'package:foodappadminpanal/styles/colors.dart';
import 'package:foodappadminpanal/widgets/home_screen_widgets/home_drawer_widget.dart';
import 'package:foodappadminpanal/widgets/profile_screen_widgets/profile_stack_widget.dart';
import '../widgets/profile_screen_widgets/profile_screen_appbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: ProfileScreenAppBar() ,
      body: ProfileStackWidget() ,
      drawer: HomeDrawerWidget(),

    );
  }

}
