import 'package:flutter/material.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key, required this.labelText, required this.hintText, required this.controller});

  final TextEditingController controller;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.textColor,
      style: const TextStyle(
        color: AppColor.textColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.textColor,
        ),
        labelText: labelText,
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
      ),
    );
  }
}
