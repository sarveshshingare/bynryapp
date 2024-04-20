import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TspacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarheight = EdgeInsets.only(
    top: TSizes.appBarHeight * 2,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
  );
}
