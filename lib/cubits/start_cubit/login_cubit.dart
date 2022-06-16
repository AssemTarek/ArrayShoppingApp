import 'package:array_offline_shopping_app/models/user_model.dart';
import 'package:array_offline_shopping_app/screens/start_app/login.dart';
import 'package:array_offline_shopping_app/shared/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

  void changeIsPassword() {
    isPassword = !isPassword;
    emit(ChangeIsPasswordState());
  }

  UserModel? loginResult;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(UserLoginLoadingState());
    DioHelper.postData(
      url: "login",
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      loginResult = UserModel.fromJson(value.data);
      print(loginResult!.data!.email);
      emit(UserLoginSuccessState());
    }).catchError((error) {
      emit(UserLoginErrorState());
      print(error.toString());
    });
  }

  UserModel? registerResult;
  void userRegister({
  required String name,
  required String email,
  required String phone,
  required String password,
}){
    emit(UserRegisterLoadingState());
    DioHelper.postData(
        url: "register",
        data:{
          "name":name,
          "email":email,
          "phone":phone,
          "password":password,
        },
    ).then((value){
      registerResult=UserModel.fromJson(value.data);
      print(registerResult!.message);
      emit(UserRegisterSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(UserRegisterErrorState());
    });


  }




}

abstract class LoginStates {}
class LoginInitialState extends LoginStates {}
class ChangeIsPasswordState extends LoginStates {}

class UserLoginLoadingState extends LoginStates {}

class UserLoginSuccessState extends LoginStates {}

class UserLoginErrorState extends LoginStates {}

class UserRegisterLoadingState extends LoginStates {}

class UserRegisterSuccessState extends LoginStates {}

class UserRegisterErrorState extends LoginStates {}
