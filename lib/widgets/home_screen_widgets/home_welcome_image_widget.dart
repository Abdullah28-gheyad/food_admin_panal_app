import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class HomeWelcomeImage extends StatelessWidget {
  const HomeWelcomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          color: AppColor.primaryColor ,
          borderRadius: BorderRadius.circular(10) ,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://ak.picdn.net/shutterstock/videos/5039891/thumb/1.jpg')
          )
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) , bottomRight:Radius.circular(50))
                  ),
                  child: Center(child: Text('Vegi',style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),)),
                ) ,
                SizedBox(height: 5,) ,
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Text('30% Off',style: TextStyle(color: Colors.white , fontSize: 50 , fontWeight: FontWeight.bold),),
                      Text('on all vegetable products',style: TextStyle(color: Colors.green[100] ,  fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    ) ;
  }
}
