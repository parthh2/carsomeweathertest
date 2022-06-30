import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../colors/app_colors.dart';

extension MyCustomTextStyles on String {
  Text getLocationTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(10.0),
          fontWeight: FontWeight.normal,
        ),
        textScaleFactor: 1.0,
      );

  Text getDoctorTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(11.0),
          fontWeight: FontWeight.normal,
        ),
        textScaleFactor: 1.0,
      );

  Text getAfterTreatmentServiceTextStyle(ScreenUtil screenUtil) => Text(
        toUpperCase(),
        style: TextStyle(
          height: 1.2,
          color: AppColors.white,
          fontSize: screenUtil.setSp(18.0),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
      );

  Text getBookYourAppointTextStyle(ScreenUtil screenUtil) => Text(
        toUpperCase(),
        style: TextStyle(
          height: 1,
          color: AppColors.darkBlue2,
          fontSize: screenUtil.setSp(14.0),
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
      );

  Text getBookNowTextStyle(ScreenUtil screenUtil) => Text(
        toUpperCase(),
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(10.0),
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
      );

  Text getSaveTimeTextStyle(ScreenUtil screenUtil) => Text(
        toUpperCase(),
        style: TextStyle(
          height: 1,
          color: AppColors.lightDarkOrange,
          fontSize: screenUtil.setSp(16.0),
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
      );

  Text getSaveTimeTextTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.black,
          fontSize: screenUtil.setSp(12.0),
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.start,
        textScaleFactor: 1.0,
      );

  Text getDownloadTheAppNowTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.black,
          fontSize: screenUtil.setSp(18.0),
          fontWeight: FontWeight.normal,
        ),
        textScaleFactor: 1.0,
      );

  Text getSocialNameTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(12.0),
          fontWeight: FontWeight.normal,
        ),
        textScaleFactor: 1.0,
      );

  Text getChooseFromProblemItemsTextStyle(ScreenUtil screenUtil,
          {bool isSelected = false}) =>
      Text(
        this,
        style: TextStyle(
          height: 1,
          color: isSelected ? AppColors.white : AppColors.black,
          fontSize: screenUtil.setSp(11.0),
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 2,
        textScaleFactor: 1.0,
        textAlign: TextAlign.center,
      );

  Text getBrandIndiaTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1.2,
          color: AppColors.darkBlue3,
          fontSize: screenUtil.setSp(14.0),
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 3,
        textScaleFactor: 1.0,
        textAlign: TextAlign.center,
      );

  Text getOurDoctorTitleTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(12.0),
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 1,
        textScaleFactor: 1.0,
      );

  Text getCurrentDoctorNameTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(12.0),
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
        maxLines: 1,
      );

  Text getCurrentDoctorAddressTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(10.0),
          fontWeight: FontWeight.w300,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
        maxLines: 1,
      );

  Text getDoctorRoleTextStyle(ScreenUtil screenUtil) => Text(
        toUpperCase(),
        style: TextStyle(
          height: 1,
          color: AppColors.darkBlue5,
          fontSize: screenUtil.setSp(16.0),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.start,
        textScaleFactor: 1.0,
        maxLines: 1,
      );

  Text getDoctorTypeTextStyle(ScreenUtil screenUtil) => Text(
        toUpperCase(),
        style: TextStyle(
          height: 1,
          color: AppColors.darkBlue5,
          fontSize: screenUtil.setSp(14.0),
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.start,
        textScaleFactor: 1.0,
        maxLines: 1,
      );

  Text getUpcomingAppointmentTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(14.0),
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.start,
        textScaleFactor: 1.0,
        maxLines: 1,
      );

  Text getUpcomingAppointmentBlueTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.darkBlue5,
          fontSize: screenUtil.setSp(14.0),
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.start,
        textScaleFactor: 1.0,
        maxLines: 1,
      );

  Text getProfileNameTextStyle(ScreenUtil screenUtil) => Text(
        this,
        style: TextStyle(
          height: 1,
          color: AppColors.white,
          fontSize: screenUtil.setSp(14.0),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.start,
        textScaleFactor: 1.0,
        maxLines: 1,
      );
}
