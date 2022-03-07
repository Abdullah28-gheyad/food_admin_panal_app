import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappadminpanal/cubites/app_cubit/cubit.dart';
import 'package:foodappadminpanal/cubites/app_cubit/states.dart';
import 'package:foodappadminpanal/screens/home_screen.dart';
import 'package:foodappadminpanal/screens/login_screen.dart';
import 'package:foodappadminpanal/screens/profile_screen.dart';
import 'package:foodappadminpanal/screens/review_cart_screen.dart';

import '../../styles/colors.dart';
import '../custom_widgets/list_tile_widget.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context) ;
        return Drawer(
          backgroundColor: AppColor.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 36,
                              backgroundColor: Colors.red,
                              backgroundImage: NetworkImage(cubit.userModel.image),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome ${cubit.userModel.name}',
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ) ,
                              SizedBox(height: 5,) ,
                              Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: OutlinedButton(onPressed: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
                                  }, child: Text('Logout',style: TextStyle(color: Colors.black),)))
                            ],
                          ))
                    ],
                  )) ,
              ListTileWidget(iconData: Icons.home_outlined, text: 'Home',onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())) ;
              },) ,
              ListTileWidget(iconData: Icons.shop_outlined, text: 'Review Cart' , onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCartScreen())) ;
              },) ,
              ListTileWidget(iconData: Icons.person, text: 'My Profile' , onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())) ;
              },) ,
              ListTileWidget(iconData: Icons.notifications_none_outlined, text: 'Notifications') ,
              ListTileWidget(iconData: Icons.star_border_outlined, text: 'Rating & Review') ,
              ListTileWidget(iconData: Icons.favorite_border, text: 'Wishlist') ,
              ListTileWidget(iconData: Icons.copy_outlined, text: 'Raise a Complaint') ,
              ListTileWidget(iconData: Icons.format_quote_outlined, text: 'FAQs') ,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,) ,
                    Text('Contact Support' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),) ,
                    SizedBox(height: 10,) ,
                    Text('Call Us:   01008061806' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),) ,
                    Text('mail Us:   01008061806' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                  ],
                ),
              ) ,

            ],
          ),
        ) ;
      },
    );
  }
}
