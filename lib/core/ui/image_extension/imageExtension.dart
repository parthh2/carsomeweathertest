import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ImageExtension on String {
  Image getImage({
    ScreenUtil? screenUtil,
    double? height,
    double? width,
    Color? imgColor,
    BoxFit? boxFit,
  }) =>
      Image.asset(
        this,
        height: height != null ? screenUtil!.setHeight(height) : null,
        width: width != null ? screenUtil!.setWidth(width) : null,
        color: imgColor,
        fit: boxFit,
      );
}
