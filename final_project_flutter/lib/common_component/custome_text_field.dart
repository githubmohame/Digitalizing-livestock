// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeTextField extends StatelessWidget {
  TextEditingController controller;
  String? Function(String?) validator;
  TextInputType keyboardType;
   String?  texthint;
  List<TextInputFormatter>? inputFormatters;
    CustomeTextField({
    super.key,this.texthint,
    required this.controller,
    required this.validator,
    required this.keyboardType,
      this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(inputFormatters: inputFormatters,onSaved: validator,
      controller: controller,
      validator: validator,
      decoration:   InputDecoration(hintText: texthint,
        errorStyle:const TextStyle(color: Colors.white, fontSize: 15),
        contentPadding: const EdgeInsets.all(20),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
      ),
      keyboardType: keyboardType,
    );
  }
}
