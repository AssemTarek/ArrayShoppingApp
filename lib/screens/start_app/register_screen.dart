import 'package:another_flushbar/flushbar.dart';
import 'package:array_offline_shopping_app/cubits/start_cubit/login_cubit.dart';
import 'package:array_offline_shopping_app/shared/local/components.dart';
import 'package:array_offline_shopping_app/shared/local/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Form(
                key:formKey ,
                child: Column(
                  children: [
                    Text(
                      "Register Now",
                      style: MyStyles.titleStyle,
                    ),
                    Text(
                      "register now to enjoy with our offers",
                      style: MyStyles.subtitleStyle,
                    ),
                    const SizedBox(height: 50),
                    MyComponent.myTextFormField(
                      controller: nameController,
                      type: TextInputType.text,
                      label: "name",
                      prefix: Icons.person,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "name is required";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    MyComponent.myTextFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: "email",
                      prefix: Icons.email,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "email is required";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    MyComponent.myTextFormField(
                      controller: phoneController,
                      type: TextInputType.number,
                      label: "phone",
                      prefix: Icons.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "phone is required";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    MyComponent.myTextFormField(
                      controller: passwordController,
                      type: TextInputType.text,
                      label: "password",
                      prefix: Icons.lock,
                      isPassword: LoginCubit.get(context).isPassword,
                      suffix:LoginCubit.get(context).isPassword? Icons.remove_red_eye:Icons.visibility_off,
                      suffixPressed: () {
                        LoginCubit.get(context).changeIsPassword();
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    MyComponent.myTextFormField(
                      controller: confirmPasswordController,
                      type: TextInputType.text,
                      label: "confirm Password ",
                      prefix: Icons.lock,
                      isPassword: LoginCubit.get(context).isPassword,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "confirm Password is required";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    MyComponent.myElevatedButton(
                      onPressed: () {
                     if(formKey.currentState!.validate())
                     {
                       if(passwordController.text==confirmPasswordController.text)
                       {
                         LoginCubit.get(context).userRegister(
                             name: nameController.text,
                             email: emailController.text,
                             phone: phoneController.text,
                             password: passwordController.text,
                         );
                       }else{
                         Flushbar(
                           message: "passwords are not the same",
                           backgroundColor: Colors.red,
                           icon: Icon(
                             Icons.lock,
                             size: 28.0,
                             color: Colors.blue[300],
                           ),
                           duration: const Duration(seconds: 3),
                           leftBarIndicatorColor: Colors.blue[300],
                         ).show(context);
                       }
                     }
                      },
                      text: "Register",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
