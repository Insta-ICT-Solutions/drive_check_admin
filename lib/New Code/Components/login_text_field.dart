import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyBoardType;
  final bool isPassword;
  final TextEditingController controller;
  const LoginTextField({super.key, required this.hintText, required this.controller, required this.keyBoardType, required this.isPassword});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}
class _LoginTextFieldState extends State<LoginTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: widget.isPassword ? isObscure : false,
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          hintText: widget.hintText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color(0xFFCED4DA),
              width: 5.0
            )
          ),
          suffixIcon: widget.isPassword ? isObscure ? IconButton(onPressed: (){
            setState(() {
              isObscure = !isObscure;
            });
          }, icon: Icon(Icons.visibility_rounded, color: Colors.deepOrangeAccent,)) : IconButton(onPressed: (){
            setState(() {
              isObscure = !isObscure;
            });
          }, icon: Icon(Icons.visibility_off_rounded, color: Colors.deepOrangeAccent)) : null
        ),
    );
  }
}
