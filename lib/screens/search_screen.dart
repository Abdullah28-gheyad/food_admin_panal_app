import 'package:flutter/material.dart';
import 'package:foodappadminpanal/styles/colors.dart';
import 'package:foodappadminpanal/widgets/search_screen_widgets/search_body_widget.dart';
import 'package:foodappadminpanal/widgets/search_screen_widgets/search_item_widget.dart';

import '../widgets/search_screen_widgets/search_appbar_widget.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController() ;
   SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: SearchAppBarWidget(),
      body: SearchBodyWidget(searchController: searchController),
    );
  }
}
