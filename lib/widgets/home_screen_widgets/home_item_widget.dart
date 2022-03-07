import 'package:flutter/material.dart';
import 'package:foodappadminpanal/models/product_model.dart';
import 'package:foodappadminpanal/screens/product_details_screen.dart';

import '../../styles/colors.dart';

class HomeItemWidget extends StatelessWidget {
  ProductModel model ;
   HomeItemWidget({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen(model:model))) ;
      },
      child: Container(
        height:260,
        width: 194,
        decoration: BoxDecoration(
            color: AppColor.itemColor ,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image(
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: NetworkImage(model.productImage)
                ),
              ) ,
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.productName , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                    Text(model.productPrice+' \$' , style: TextStyle(color: Colors.grey,),) ,
                    SizedBox(height: 5,) ,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10) ,
                                border: Border.all(
                                    width: 1 ,
                                    color: AppColor.scaffoldColor
                                )
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(child: Text('50 Gram' , style: TextStyle(color: Colors.grey , fontSize: 10),maxLines: 1,overflow: TextOverflow.ellipsis,)) ,
                                    Expanded(child: Icon(Icons.arrow_drop_down , color: AppColor.primaryColor,))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5,) ,
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10) ,
                                border: Border.all(
                                    width: 1 ,
                                    color: AppColor.scaffoldColor
                                )
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.remove,color: AppColor.primaryColor,size: 17,) ,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text('1',style: TextStyle(color: AppColor.primaryColor),),
                                  ),
                                  Icon(Icons.add,color: AppColor.primaryColor,size: 17,) ,

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
