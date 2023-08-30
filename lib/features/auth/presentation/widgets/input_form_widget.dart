import 'package:flutter/material.dart';
import '../../../../core/utils/utils.dart';

class InputRenderer extends StatelessWidget {
  const InputRenderer({Key? key, required this.hintText, required this.controller, required this.keyBoardType}) : super(key: key);
  final String hintText;
  final TextInputType keyBoardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (v) {
        if(v!.isEmpty){
          return "Field required";
        }
        return null;
      },
      keyboardType: keyBoardType,
      decoration: InputDecoration(
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
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 14,
            color: CustomColor.liteGreen,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
