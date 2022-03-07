import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappadminpanal/cubites/app_cubit/cubit.dart';
import 'package:foodappadminpanal/cubites/app_cubit/states.dart';

class CircleAvatarStack extends StatelessWidget {
  const CircleAvatarStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context) ;
        return Positioned(
          top: 80,
          left: 40,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(cubit.userModel.image),
          ),
        ) ;
      },
    ) ;
  }
}
