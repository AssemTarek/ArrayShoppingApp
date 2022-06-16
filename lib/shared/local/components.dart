import 'package:flutter/material.dart';

class MyComponent {
  static navigateAndFinish(BuildContext context, Widget screen) =>
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
          (route) => false);

  static navigateTo(BuildContext context, Widget screen) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ));

  static Widget myTextFormField({
    required TextEditingController controller,
    required TextInputType type,
    void Function(String)? onChange,
    String? Function(String?)? validator,
    required String label,
    required IconData prefix,
    bool isPassword = false,
    IconData? suffix,
    void Function()? suffixPressed,
    void Function()? onTap,
    bool readOnly = false,
  }) =>
      TextFormField(
        cursorRadius: const Radius.circular(10.0),
        validator: validator,
        textInputAction: TextInputAction.next,
        readOnly: readOnly,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onChanged: onChange,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: suffixPressed!,
                )
              : null,
        ),
      );

  static Widget myTextButton({
    required void Function()? onPressed,
    required String text,
  }) =>
      TextButton(
        onPressed: onPressed,
        child: Text(text),
      );

  static myElevatedButton({
    required void Function()? onPressed,
    required String text,
  }) =>
      ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      );
}
