import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ProductAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Product Details'),
      backgroundColor: AppColor.primaryColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity,60) ;
}
