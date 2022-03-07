import 'package:flutter/material.dart';
import 'package:foodappadminpanal/styles/colors.dart';
import 'package:foodappadminpanal/widgets/review_cart_screen_widgets/cart_item_widget.dart';

class ReviewCartScreen extends StatelessWidget {
  const ReviewCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        title: Text('Review Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>CartItemWidget(),
                      separatorBuilder: (context,index)=>Column(children: [SizedBox(height: 10,) , Divider()],),
                      itemCount: 10
                  ),
                ) ,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Amount') ,
                      SizedBox(height: 5,) ,
                      Text('\$ 170.00' ,style: TextStyle(color: Colors.green),) ,
                    ],
                  ) ,
                  Container(
                    width: 150,
                    padding: EdgeInsetsDirectional.all(15),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor ,
                      borderRadius: BorderRadius.circular(15) ,
                    ),
                    child: Center(child: Text('Submit')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
