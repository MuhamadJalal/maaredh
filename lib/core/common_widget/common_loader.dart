import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/common_widget/barrel_common_widget.dart';
import 'package:maaredh/core/common_widget/common_text.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class CustomLoader extends StatelessWidget {
  final String? text;

  const CustomLoader({super.key, this.text});

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 1.5.sw,
                top: 1.5.sw,
                right: 1.5.sw,
                bottom: 1.5.sw,
              ),
              width: 14.sw,
              height: 14.sw,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppRepoColors().appPrimaryColor),
                backgroundColor: AppRepoColors().appBorderColor,
                strokeWidth: 1.sw,
              ),
            ),
            Container(
              width: 10.sw,
              height: 10.sw,
              alignment: Alignment.center,
              child: ClipOval(
                child: CustomText(
                  text: (text ?? ''),
                  textAlign: TextAlign.center,
                  fontSize: 4.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppRepoColors().appFontBlackColor,
                ),
              ),
            )
          ],
        ),
      );
}
