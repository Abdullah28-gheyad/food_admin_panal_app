import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappadminpanal/cubites/app_cubit/cubit.dart';
import 'package:foodappadminpanal/cubites/app_cubit/states.dart';

import '../../styles/colors.dart';
import '../custom_widgets/list_tile_widget.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context) ;
        return Positioned(
          top: 130,
          right: 0,
          left: 0,
          child: Container(
            height: 600,
            decoration: BoxDecoration(
                color: AppColor.scaffoldColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30) , topLeft:Radius.circular(30) )
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 150 ,top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cubit.userModel.name) ,
                              Text(cubit.userModel.email),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,) ,
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit , color: AppColor.primaryColor,size: 20,),
                          ),
                        )
                      ],
                    ) ,
                    Divider(
                      color: Colors.grey,
                    ) ,
                    Row(
                      children: [
                        Expanded(child: ListTileWidget(iconData: Icons.shop_outlined, text: 'My Orders',onTap: (){})),
                        Spacer() ,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ) ,
                    Row(
                      children: [
                        Expanded(child: ListTileWidget(iconData: Icons.location_on, text: 'My Delivery Address',onTap: (){})),
                        Spacer() ,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ) ,
                    Row(
                      children: [
                        Expanded(child: ListTileWidget(iconData: Icons.person, text: 'Refer A Friend',onTap: (){})),
                        Spacer() ,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ) ,
                    Row(
                      children: [
                        Expanded(child: ListTileWidget(iconData: Icons.copy, text: 'Terms & Conditions',onTap: (){})),
                        Spacer() ,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ) ,
                    Row(
                      children: [
                        Expanded(child: ListTileWidget(iconData: Icons.privacy_tip_outlined, text: 'Privacy Policy',onTap: (){})),
                        Spacer() ,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),  Divider(
                      color: Colors.grey,
                    ) ,
                    Row(
                      children: [
                        Expanded(child: ListTileWidget(iconData: Icons.info_outline, text: 'About',onTap: (){})),
                        Spacer() ,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ) ,
                    Row(
                      children: [
                        Expanded(child: ListTileWidget(iconData: Icons.logout, text: 'Logout',onTap: (){})),
                        Spacer() ,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ) ;
      },
    );
  }
}
