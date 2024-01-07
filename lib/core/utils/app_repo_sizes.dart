import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRepoSizes {
  AppRepoSizes._internal();

  static final AppRepoSizes _instance = AppRepoSizes._internal();

  factory AppRepoSizes() => _instance;

  BorderRadius circularCornerRadius = BorderRadius.circular(100.sw);
  BorderRadius defaultCardCornerRadius = BorderRadius.circular(4.sw);
  BorderRadius smallCardCornerRadius = BorderRadius.circular(2.sw);
  BorderRadius smallestCardCornerRadius = BorderRadius.circular(1.sw);
  BorderRadius tinyCardCornerRadius = BorderRadius.circular(.5.sw);

  BorderRadius onlyRightCornerRadius = BorderRadius.only(topRight: Radius.circular(4.sw), bottomRight: Radius.circular(4.sw));
  BorderRadius onlyLeftCornerRadius = BorderRadius.only(bottomLeft: Radius.circular(4.sw), topLeft: Radius.circular(4.sw));

  BorderRadius onlyRightCircularCornerRadius = BorderRadius.only(topRight: Radius.circular(100.sw), bottomRight: Radius.circular(100.sw));
  BorderRadius onlyLeftCircularCornerRadius = BorderRadius.only(bottomLeft: Radius.circular(100.sw), topLeft: Radius.circular(100.sw));

  BorderRadius onlyTopCircularCornerRadius = BorderRadius.only(topLeft: Radius.circular(8.sw), topRight: Radius.circular(8.sw));
  BorderRadius onlyTopCornerRadius = BorderRadius.only(topLeft: Radius.circular(4.sw), topRight: Radius.circular(4.sw));
  BorderRadius onlyTopSmallestCornerRadius = BorderRadius.only(topLeft: Radius.circular(2.sw), topRight: Radius.circular(2.sw));

  BorderRadius onlyBottomSmallestCornerRadius = BorderRadius.only(bottomLeft: Radius.circular(2.sw), bottomRight: Radius.circular(2.sw));
  BorderRadius onlyBottomCornerRadius = BorderRadius.only(bottomLeft: Radius.circular(4.sw), bottomRight: Radius.circular(4.sw));
}
