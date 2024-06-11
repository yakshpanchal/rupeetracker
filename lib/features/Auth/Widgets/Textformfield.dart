import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final dynamic prefixIcon; // Accept either IconData or AssetImage
  final FormFieldValidator<String> validator;
  final bool enabled;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  const CustomTextFormFiled({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    required this.validator,
    required this.enabled,
    required this.keyboardType,
    required this.obscureText,
    required this.onChanged,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    Widget? prefixIcon;

    if (widget.prefixIcon is IconData) {
      prefixIcon = Icon(widget.prefixIcon as IconData);
    } else if (widget.prefixIcon is AssetImage) {
      prefixIcon = ImageIcon(widget.prefixIcon as AssetImage);
    }

    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Colors.transparent,
        labelText: widget.labelText,
        floatingLabelStyle: TextStyle(color: Colors.black),
      ),
      validator: widget.validator,
    );
  }
}
