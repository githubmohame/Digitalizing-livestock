// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeTextField extends StatelessWidget {
  TextEditingController controller;
  String? Function(String?) validator;
  TextInputType keyboardType;
   
  List<TextInputFormatter>? inputFormatters;
    CustomeTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
      this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(inputFormatters: inputFormatters,
      controller: controller,
      validator: validator,
      decoration: const InputDecoration(
        errorStyle: TextStyle(color: Colors.white, fontSize: 15),
        contentPadding: EdgeInsets.all(20),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
      ),
      keyboardType: keyboardType,
    );
  }
}
