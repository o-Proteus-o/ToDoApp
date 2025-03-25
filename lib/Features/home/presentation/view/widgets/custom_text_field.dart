import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.onSaved,
    this.onChanged,
  });
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Please enter $hintText";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey.shade300,
          filled: true,
          contentPadding: contentPadding,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
