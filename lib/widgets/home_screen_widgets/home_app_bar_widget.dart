import 'package:flutter/material.dart';
import 'package:foodappadminpanal/screens/search_screen.dart';

import '../../styles/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      backgroundColor: AppColor.primaryColor,
      title: Text('Home',style: TextStyle(color: Colors.black),),
      actions: [
        CircleAvatar(
          backgroundColor: AppColor.avatarColor,
          radius: 14,
          child: Center(child: InkWell(onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen())) ;
          },child: Icon(Icons.search , color: Colors.black , size: 20,))),
        ) ,
        SizedBox(width: 10,),
        CircleAvatar(
          backgroundColor: AppColor.avatarColor,
          radius: 14,
          child: Center(child: Icon(Icons.shop , color: Colors.black , size: 20,)),
        ) ,
        SizedBox(width: 10,),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60) ;
}
