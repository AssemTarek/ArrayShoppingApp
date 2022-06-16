import 'package:array_offline_shopping_app/screens/navigation_screens/home_screen.dart';
import 'package:array_offline_shopping_app/screens/start_app/login.dart';
import 'package:array_offline_shopping_app/screens/start_app/on_boarding.dart';
import 'package:array_offline_shopping_app/screens/start_app/register_screen.dart';
import 'package:array_offline_shopping_app/shared/local/cash_helper.dart';
import 'package:array_offline_shopping_app/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  DioHelper.init();
  bool onBoarding=await CashHelper.getData(key: "onBoarding",def: true);
  runApp( MyApp(onBoarding:onBoarding));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key,required this.onBoarding}) : super(key: key);
  bool onBoarding;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),
      home:HomeScreen(),
      //onBoarding? OnBoardingScreen():LoginScreen(),
    );
  }
}
