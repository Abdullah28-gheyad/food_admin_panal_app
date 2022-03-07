import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappadminpanal/cubites/app_cubit/cubit.dart';
import 'package:foodappadminpanal/cubites/app_cubit/states.dart';

import 'home_item_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return  ConditionalBuilder(
          condition: cubit.herbsList.isNotEmpty&&cubit.fruitsList.isNotEmpty,
          fallback: (context)=>Center(child: CircularProgressIndicator()),
          builder:(context)=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,) ,
              Row(
                children: [
                  Text('Herbs Seasonings' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
                  Spacer() ,
                  Text('see all' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),) ,

                ],
              ) ,
              SizedBox(height: 10,) ,
              SizedBox(
                height:260 ,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>HomeItemWidget(model: cubit.herbsList[index]),
                    separatorBuilder: (context,index)=>SizedBox(width: 10,),
                    itemCount: 10
                ),
              ) ,
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Fresh Fruits' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
                  Spacer() ,
                  Text('see all' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),) ,

                ],
              ) ,
              SizedBox(height: 10,) ,
              SizedBox(
                height:260 ,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>HomeItemWidget(model: cubit.fruitsList[index]),
                    separatorBuilder: (context,index)=>SizedBox(width: 10,),
                    itemCount: 10
                ),
              ) ,
            ],
          ) ,

        ) ;
      },
    );
  }
}
