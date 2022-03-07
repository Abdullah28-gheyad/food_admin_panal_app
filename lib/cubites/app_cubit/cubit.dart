import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappadminpanal/cubites/app_cubit/states.dart';
import 'package:foodappadminpanal/models/product_model.dart';
import 'package:foodappadminpanal/models/user_model.dart';
import 'package:foodappadminpanal/shared/constants.dart';

class AppCubit extends Cubit <AppStates>
{
  AppCubit():super(AppInitialState()) ;
  static AppCubit get(context)=>BlocProvider.of(context) ;

  late List <ProductModel> herbsList ;
  void getHerbs ()
  {
    herbsList=[] ;
    emit(AppGetHerbsLoadingState()) ;
    FirebaseFirestore.instance
    .collection('hurbs')
    .get()
    .then((value){
      for (var e in value.docs) {
        herbsList.add(ProductModel.fromJson(e.data())) ;
      }
      emit(AppGetHerbsSuccessState()) ;
    })
    .catchError((error){
      print (error.toString()) ;
      emit(AppGetHerbsErrorState()) ;
    }) ;
  }
  late List <ProductModel> fruitsList ;
  void getFruits ()
  {
    fruitsList=[] ;
    emit(AppGetFruitsLoadingState()) ;
    FirebaseFirestore.instance
        .collection('fruits')
        .get()
        .then((value){
      for (var e in value.docs) {
        fruitsList.add(ProductModel.fromJson(e.data())) ;
      }
      emit(AppGetFruitsSuccessState()) ;
    })
        .catchError((error){
      print (error.toString()) ;
      emit(AppGetFruitsErrorState()) ;
    }) ;
  }

  List <ProductModel> searchList=[] ;
  void searchProducts(String text)
  {
    searchList=[] ;
    for (var e in herbsList) {
      if (e.productName.toLowerCase().contains(text))
        {
          searchList.add(e) ;
        }
    }
    for (var e in fruitsList) {
      if (e.productName.toLowerCase().contains(text))
      {
        searchList.add(e) ;
      }

    }
    emit(SearchProductSuccessState()) ;
  }

  late UserModel userModel ;
   void getUserModel ()
  {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value){
          userModel = UserModel.fromJson(value.data()!) ;
      emit(GetUserDataSuccessState()) ;
    })
        .catchError((error){
          print (error.toString()) ;
         emit(GetUserDataErrorState()) ;
    }) ;
}
}