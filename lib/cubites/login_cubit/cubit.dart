import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:foodappadminpanal/cubites/login_cubit/states.dart';
import 'package:foodappadminpanal/models/user_model.dart';
import 'package:foodappadminpanal/shared/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late UserModel userModel ;
  void googleSignIn()
  {
    emit(GoogleLoginLoadingState()) ;
    GoogleSignIn().signIn()
    .then((value){
      // value is GoogleSignInAccount -->googleUser
      value?.authentication
          .then((value){
        // value is GoogleSignInAuthentication -->googleAuth
        final credential = GoogleAuthProvider.credential(
          accessToken: value?.accessToken,
          idToken: value?.idToken,
        );

        FirebaseAuth.instance.signInWithCredential(credential)
        .then((value){
          userModel = UserModel(name: value.user!.displayName!, image: value.user!.photoURL!, email: value.user!.email!, id: value.user!.uid!);
          uId = userModel.id ;
          FirebaseFirestore.instance.collection('users')
          .doc(userModel.id)
          .set(userModel.toMap())
          .then((value){
            emit(LoginSuccessState()) ;
          })
          .catchError((error){
            print (error.toString()) ;
            emit(LoginErrorState()) ;
          }) ;
        })
        .catchError((error){
          print (error.toString()) ;
          emit(LoginErrorState()) ;
        });
      })
          .catchError((error){
            print (error.toString()) ;
            emit(LoginErrorState()) ;
      });
    })
    .catchError((error){
      print (error.toString()) ;
      emit(LoginErrorState()) ;
    });

  }

  void facebookSingIn()
  {
    emit(FacebookLoginLoadingState());
    FacebookAuth.instance.login()
    .then((value) {
      //value is LoginResult-->loginResult
      FacebookAuthProvider.credential(value.accessToken!.token);
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(value.accessToken!.token);
      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)
      .then((value){
        emit(LoginSuccessState()) ;
      })
      .catchError((error){
        print (error.toString()) ;
        emit(LoginErrorState()) ;
      });
    })
    .catchError((error){
      print (error.toString()) ;
      emit(LoginErrorState());
    });
  }


  Future<UserCredential> signInWithFacebook() async {
    emit(FacebookLoginLoadingState());

    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
   // emit(LoginSuccessState()) ;
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
