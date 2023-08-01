import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.controller, required this.hint, required this.iconData,this.type});
  final TextEditingController controller;
  final String hint;
  final IconData iconData;
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: Colors.grey.withOpacity(.7), fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.zero,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        icon: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Icon(
              iconData,
              color: Colors.grey,
            )),
      ),
    );
  }
}
