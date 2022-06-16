import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialState());
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);

  List<Widget> screenList(){
   List<Widget> screens=[

   ];
   return screens;
  }

  int currentIndex=0;
  void changeBottomNavigationBarItem(int index){
    currentIndex=index;
    emit(ChangeCurrentIndexState());
  }




}
abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class ChangeCurrentIndexState extends HomeStates{}
