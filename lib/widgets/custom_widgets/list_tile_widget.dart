import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  IconData iconData;
  String text ;
  Function? onTap ;
  ListTileWidget({required this.iconData , required this.text,this.onTap}) ;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTap!() ;
      },
      leading: Icon(iconData,size: 30,),
      title: Text(text,style: TextStyle(color: Colors.black54),),
    ) ;
  }
}
