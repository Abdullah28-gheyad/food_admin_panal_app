import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class SearchAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const SearchAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      title: Text('Search Items' , style: TextStyle(color: Colors.white),),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.menu , color: Colors.white,),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size(double.infinity,60);
}
