import 'package:array_offline_shopping_app/cubits/start_cubit/login_cubit.dart';
import 'package:array_offline_shopping_app/screens/start_app/register_screen.dart';
import 'package:array_offline_shopping_app/shared/local/components.dart';
import 'package:array_offline_shopping_app/shared/local/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Login",
                        style: MyStyles.titleStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "login to enjoy with our offers",
                        style: MyStyles.subtitleStyle,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MyComponent.myTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: "email",
                        prefix: Icons.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email is required";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyComponent.myTextFormField(
                        controller: passwordController,
                        type: TextInputType.text,
                        label: "password",
                        prefix: Icons.lock,
                        suffix: cubit.isPassword?Icons.remove_red_eye:Icons.visibility_off,
                        suffixPressed: () {
                          cubit.changeIsPassword();
                        },
                        isPassword:cubit.isPassword,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "password is required";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      MyComponent.myElevatedButton(
                          onPressed:  () {
                            if(formKey.currentState!.validate()){
                              cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }

                          },
                          text: "sign in",
                      ),


                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account"),
                          MyComponent.myTextButton(
                            onPressed: () {
                              MyComponent.navigateTo(context, RegisterScreen());
                            },
                            text: "Sign up",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
