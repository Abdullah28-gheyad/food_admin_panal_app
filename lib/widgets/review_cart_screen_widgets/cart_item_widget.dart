import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child: Row(
        children:  [
          Expanded(
            child: Image(
                height: 100,
                fit: BoxFit.fill,
                image: NetworkImage('https://pngimg.com/uploads/basil/basil_PNG26.png')),
          ) ,
          SizedBox(width: 10,) ,
          Expanded(child: Column(
            children: [
              Text('Product Name' , style: TextStyle(fontWeight: FontWeight.bold),),
              Text('50\$' , style: TextStyle(fontWeight: FontWeight.bold),),
              Spacer() ,
              Text('50 Gram' ,),
            ],
          )) ,
          SizedBox(width: 20,) ,
          Column(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.delete)) ,
              OutlinedButton(onPressed: (){}, child: Row(
                children: [
                  Icon(Icons.add,color: AppColor.primaryColor,)  ,
                  Text('ADD' , style: TextStyle(color: AppColor.primaryColor),)
                ],
              ))
            ],
          )
        ],
      ),
    ) ;
  }
}
