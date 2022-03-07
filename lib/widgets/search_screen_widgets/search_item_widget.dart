import 'package:flutter/material.dart';
import 'package:foodappadminpanal/models/product_model.dart';
import 'package:foodappadminpanal/styles/colors.dart';

class SearchItemWidget extends StatelessWidget {
  ProductModel model ;
   SearchItemWidget({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 130,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(model.productImage)
                  )
              ),
            ),
          ) ,
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.productName , style: TextStyle(fontWeight: FontWeight.bold),),
                Text(model.productPrice+'\$/50 Gram' , style: TextStyle(color: Colors.black38),),
                SizedBox(height: 40,)  ,
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15) ,
                      border: Border.all(color: Colors.black38 ,width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text('50 Gram' , style: TextStyle(color: Colors.black38),) ,
                        Icon(Icons.arrow_drop_down , color: AppColor.primaryColor,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 50,) ,
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15) ,
                border: Border.all(color: Colors.black38 ,width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('50 Gram' , style: const TextStyle(color: Colors.black38),) ,
                  Icon(Icons.arrow_drop_down , color: AppColor.primaryColor,)
                ],
              ),
            ),
          )
        ],
      ),
    ) ;
  }
}
