import 'package:bynryapp/utils/constants/colors.dart';
import 'package:bynryapp/utils/constants/sizes.dart';

import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(
      {Key? key,
      this.width,
      this.height,
      this.radius = TSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = TColors.borderPrimary,
      this.backGroundColor = TColors.white,
      this.padding,
      this.margin})
      : super(key: key);

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backGroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
