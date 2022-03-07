import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappadminpanal/cubites/app_cubit/cubit.dart';
import 'package:foodappadminpanal/cubites/app_cubit/states.dart';
import 'package:foodappadminpanal/widgets/search_screen_widgets/search_item_widget.dart';

class SearchBodyWidget extends StatelessWidget {
   var searchController  ;
  SearchBodyWidget({Key? key,required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context) ;
        return  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Items') ,
              SizedBox(height: 10,) ,
              TextFormField(
                onChanged: (value){
                  cubit.searchProducts(value) ;
                },
                controller:searchController ,
                validator: (String? value){
                  if (value!.isEmpty)
                    return 'Please enter the keyWord You search for' ;
                  return null ;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20) ,
                    ) ,
                    fillColor: Colors.grey[300],
                    focusColor: Colors.grey,
                    prefixIconColor: Colors.black,
                    hoverColor: Colors.grey,
                    filled: true,
                    hintText: 'Search for items in store' ,
                    suffixIcon: Icon(Icons.search)
                ),
              ) ,
              SizedBox(height: 20,) ,
              ConditionalBuilder(
                fallback: (context)=>Container(),
                condition: cubit.searchList.isNotEmpty,
                builder: (context)=>Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index)=> SearchItemWidget(model: cubit.searchList[index]),
                      separatorBuilder: (context,index)=>const SizedBox(height: 20,),
                      itemCount: cubit.searchList.length),
                ),
              )
            ],
          ),
        ) ;
      },
    );
  }
}
