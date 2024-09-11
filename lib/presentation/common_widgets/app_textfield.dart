import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';


class AppTextfield extends StatelessWidget {
  const AppTextfield(
      {super.key,
      this.controller,
      this.label,
      this.color = AppColors.textfieldLightSurfaceColor,
      this.contentPadding,
      this.filled = false,
      this.hint,
      this.hintStyle,
      this.maxLines = 1,
      this.borderRadius = 10,
        this.showBorder=true,
      this.textStyle,
      this.validator,this.onChange});

  final TextEditingController? controller;
  final String? label;
  final bool filled;
  final bool showBorder;
  final Color color;
  final EdgeInsets? contentPadding;
  final String? hint;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final int maxLines;
  final double borderRadius;
  final String? Function(String? value)? validator;
  final  Function(String value)? onChange;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

        controller: controller,
        maxLines: maxLines,
        validator: validator,
        onChanged: onChange,
        style: textStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.black),
        decoration: InputDecoration(
           // alignLabelWithHint: false,

            labelText: label,
            hintText: hint,
            hintStyle: hintStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.black50),
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            filled: filled,
            fillColor: color,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border:showBorder? OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.white),
            ):null,
            enabledBorder:showBorder? OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(borderRadius),
            ):null,
            focusedBorder:showBorder? OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.white),
              borderRadius: BorderRadius.circular(borderRadius),
            ):null,errorStyle:Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.errorColor), )



    );
  }
}
