import 'package:flutter/material.dart';
import 'package:foodappadminpanal/models/product_model.dart';

import '../../styles/colors.dart';

class ProductBodyWidget extends StatelessWidget {
  ProductModel model ;
   ProductBodyWidget({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.productName,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),) ,
          Text('\$'+model.productPrice,) ,
          Image(
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              image: NetworkImage(model.productImage)) ,
          Text('Available Options',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),) ,
          SizedBox(height: 10,) ,
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 3,
              ) ,
              SizedBox(width: 5,) ,
              Radio(
                activeColor: Colors.green[700],
                onChanged: (value){},
                value: '',
                groupValue: '',
              ) ,
              Spacer() ,
              Text('\$50') ,
              Spacer() ,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: OutlinedButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.add,color: AppColor.primaryColor,) ,
                    Text('ADD' , style: TextStyle(color: AppColor.primaryColor),) ,
                  ],
                )),
              )
            ],
          ) ,
          SizedBox(height: 30,) ,
          Text('About This Product',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),) ,
          Expanded(child: SingleChildScrollView(child: Text(model.productDescription,))) ,
          SizedBox(height: 10,),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(child: Container(
                  height: 50,
                  color: Colors.black,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite_outline_sharp , color: Colors.white,size: 20,) ,
                      SizedBox(width: 5,) ,
                      Text('Add To Wishlist' , style: TextStyle(color: Colors.white),)
                    ],
                  ),
                )),
                Expanded(child: Container(
                  height: 50,
                  color: AppColor.primaryColor,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shop_outlined , color: Colors.white,size: 20,) ,
                      SizedBox(width: 5,) ,
                      Text('Go To Cart' , style: TextStyle(color: Colors.black),)
                    ],
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    ) ;
  }
}
