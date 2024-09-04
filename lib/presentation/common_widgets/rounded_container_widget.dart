import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_colors.dart';




class RoundedContainerWidget extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? color;
  final Color? borderColor;
  final double blurRadius;
  final double borderWidth;
  final double spreadRadius;
  final Color? shadowColor;
  final bool? showBorder;
  final Offset? shadowOffset;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadiusGeometry;
  const RoundedContainerWidget(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.borderColor ,
        this.gradient,
      this.color,
      this.blurRadius = 10,
      this.spreadRadius = 0,
      this.borderRadius = 12,
      this.borderWidth = 1,
      this.showBorder = true,
      this.shadowOffset,
      this.shadowColor,
      this.borderRadiusGeometry});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width,
      height: height,


      decoration: BoxDecoration(
          color: color ??  AppColors.white,
          gradient:gradient ,
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? AppColors.black20,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              offset: shadowOffset ?? const Offset(0, 1),
            )
          ],
          border: showBorder!
              ? Border.all(
                  color:  borderColor??  AppColors.white,
                  width:   borderWidth )
              : null,
          borderRadius: borderRadiusGeometry ?? BorderRadius.all(Radius.circular(borderRadius))),
      child: child,
    );
  }
}
