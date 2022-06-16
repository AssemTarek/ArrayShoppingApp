import 'package:array_offline_shopping_app/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {},
        builder: (context, state)=> Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:HomeCubit.get(context).currentIndex,
            backgroundColor: Colors.red,
            onTap: (index){
              HomeCubit.get(context).changeBottomNavigationBarItem(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "category",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "settings",
              ),
            ],
          ),
          body: Container(),
        ),
      ),
    );
  }
}
