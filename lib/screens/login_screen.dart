import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:foodappadminpanal/cubites/app_cubit/cubit.dart';
import 'package:foodappadminpanal/cubites/login_cubit/cubit.dart';
import 'package:foodappadminpanal/cubites/login_cubit/states.dart';
import 'package:foodappadminpanal/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            AppCubit.get(context).getUserModel() ;
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/background.png',
                ),
              )),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to continue',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Vegi',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                                blurRadius: 5,
                                color: Colors.green.shade900,
                                offset: Offset(3, 3))
                          ]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      builder: (context)=>SignInButton(
                        Buttons.Facebook,
                        onPressed: () {
                          cubit.facebookSingIn() ;
                        },
                        text: 'Sign in with Facebook',
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                      condition: state is! FacebookLoginLoadingState,
                    ),
                    ConditionalBuilder(
                      builder: (context)=>SignInButton(
                        Buttons.Google,
                        onPressed: () {
                          cubit.googleSignIn();
                        },
                        text: 'Sign in with Google',
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                      condition: state is! GoogleLoginLoadingState,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'By signing in you are agreeing to our',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    Text(
                      'terms and privacy policy',
                      style: TextStyle(color: Colors.grey[800]),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
