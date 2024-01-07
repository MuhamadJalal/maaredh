import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/common_widget/barrel_common_widget.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';
import 'package:maaredh/di/injector.dart';

extension FlutterToastExtension on String {
  Future toast({Color? backgroundColor}) => showFlash(
        context: getIt<GlobalContext>().context(),
        duration: const Duration(seconds: 6),
        builder: (context, controller) => Flash(
          controller: controller,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          backgroundColor: backgroundColor ?? AppRepoColors().appFontBlackColor,
          alignment: Alignment.bottomCenter,
          child: FlashBar(
            content: CustomText(
              text: this,
              textAlign: TextAlign.center,
              fontSize: 4.sp,
              fontWeight: FontWeight.w400,
              textColor: AppRepoColors().appFontWhiteColor,
              maxLines: length,
            ),
            icon: Icon(Icons.info_outline, color: AppRepoColors().appWhiteColor),
            indicatorColor: AppRepoColors().appPrimaryColor,
          ),
        ),
      );
}
