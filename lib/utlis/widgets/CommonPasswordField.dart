import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class CommonPasswordField extends StatefulWidget {
  const CommonPasswordField({
    super.key,
    required this.labelText,
    required this.hintText,
  });
  final String labelText;
  final String hintText;

  @override
  State<CommonPasswordField> createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {
  bool isNotShow = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isNotShow,
      cursorColor: AppColor.textColor,
      style: const TextStyle(
        color: AppColor.textColor,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColor.textColor,
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: AppColor.textColor,
        ),
        focusColor: AppColor.textColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textColor,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isNotShow = !isNotShow;
            });
          },
          icon: Icon(
            isNotShow ? Icons.visibility_rounded : Icons.visibility_off_rounded,
            color: AppColor.textColor,
          ),
        ),
      ),
    );
  }
}
