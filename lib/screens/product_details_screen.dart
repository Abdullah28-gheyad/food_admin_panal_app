import 'package:flutter/material.dart';
import 'package:foodappadminpanal/models/product_model.dart';
import 'package:foodappadminpanal/styles/colors.dart';
import 'package:foodappadminpanal/widgets/product_screen_widgets/product_appbar_widget.dart';
import 'package:foodappadminpanal/widgets/product_screen_widgets/product_body_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductModel model ;
   ProductDetailsScreen({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: ProductAppBar(),
      body:  ProductBodyWidget(model:model)
    );
  }
}
