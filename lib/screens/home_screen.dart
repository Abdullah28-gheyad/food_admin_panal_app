import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodappadminpanal/styles/colors.dart';
import 'package:foodappadminpanal/widgets/custom_widgets/list_tile_widget.dart';
import 'package:foodappadminpanal/widgets/home_screen_widgets/home_app_bar_widget.dart';
import 'package:foodappadminpanal/widgets/home_screen_widgets/home_body_widget.dart';
import 'package:foodappadminpanal/widgets/home_screen_widgets/home_drawer_widget.dart';
import 'package:foodappadminpanal/widgets/home_screen_widgets/home_item_widget.dart';

import '../widgets/home_screen_widgets/home_welcome_image_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: const HomeAppBar(),
      drawer: HomeDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeWelcomeImage(),
              HomeBodyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
