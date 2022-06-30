import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetPadding on Widget {
  Widget paddingAll(double padding, ScreenUtil screenUtil) => Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        screenUtil.setWidth(padding),
        screenUtil.setHeight(padding),
        screenUtil.setWidth(padding),
        screenUtil.setHeight(padding),
      ),
      child: this);

  Widget paddingOnly(
    ScreenUtil screenUtil, {
    double paddingTop = 0,
    double paddingBottom = 0,
    double paddingLeft = 0,
    double paddingRight = 0,
  }) =>
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          screenUtil.setWidth(paddingLeft),
          screenUtil.setHeight(paddingTop),
          screenUtil.setWidth(paddingRight),
          screenUtil.setHeight(paddingBottom),
        ),
        child: this,
      );

  Widget ltrText() => Directionality(
        textDirection: TextDirection.ltr,
        child: this,
      );

  Widget centerWidget() => Center(
        child: this,
      );
}
