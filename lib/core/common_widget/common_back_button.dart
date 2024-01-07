import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/common_widget/barrel_common_widget.dart';
import 'package:maaredh/core/common_widget/common_image_widget.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? iconColor;

  const CustomBackButton({
    Key? key,
    this.onTap,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Ink(child: InkWell(onTap: onTap, child: Icon(Icons.arrow_back_ios_new_rounded, color: iconColor ?? AppRepoColors().appWhiteColor, size: 6.sw)));
}

class DefaultFloatingActionButton extends StatelessWidget {
  const DefaultFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 23.sw,
        height: 23.sw,
        child: FittedBox(
          child: Center(
            child: CustomImageProvider(
              imagePath: AppRepoAssets().logoImage,
              boxFit: BoxFit.contain,
              width: 23.sw,
              height: 23.sw,
            ),
          ),
        ),
      );
}
