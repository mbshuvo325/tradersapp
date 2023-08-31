import 'package:flutter/material.dart';
import '../../../../core/utils/utils.dart';

class InputRenderer extends StatefulWidget {
  const InputRenderer({Key? key, required this.hintText, required this.controller, required this.keyBoardType, this.obscureText = false}) : super(key: key);
  final String hintText;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  final bool obscureText;

  @override
  State<InputRenderer> createState() => _InputRendererState();
}

class _InputRendererState extends State<InputRenderer> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.hintText == CustomString.password ? obscureText : false,
      validator: (v) {
        if(v!.isEmpty){
          return "Field required";
        }
        return null;
      },
      keyboardType: widget.keyBoardType,
      decoration: InputDecoration(
        suffixIcon: widget.hintText == CustomString.password ?
        IconButton(
          onPressed: (){
            setState(() {
              obscureText = !obscureText;
            });
          },
            icon: Icon(!obscureText ? Icons.visibility_off :Icons.visibility,color: CustomColor.liteGreen,)) : null,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontSize: 14,
            color: CustomColor.liteGreen,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
