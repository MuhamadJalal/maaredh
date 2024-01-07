import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final Color? textColor;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextDecoration? textDecoration;
  final void Function()? onTap;

  const CustomText(
      {Key? key,
      this.text,
      this.textAlign,
      this.fontSize,
      this.fontHeight,
      this.maxLines,
      this.fontWeight,
      this.textColor,
      this.decorationColor,
      this.decorationThickness,
      this.textDecoration,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Text(
          text ?? '',
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              height: fontHeight,
              decoration: textDecoration,
              decorationThickness: decorationThickness,
              decorationColor: decorationColor ?? AppRepoColors().appWhiteColor,
              color: textColor ?? AppRepoColors().appWhiteColor),
        ),
      );
}

class CustomRichText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final String? secondText;
  final TextAlign? secondTextAlign;
  final int? secondMaxLines;
  final double? secondFontSize;
  final FontWeight? secondFontWeight;
  final double? secondFontHeight;
  final Color? secondTextColor;
  final Color? secondDecorationColor;
  final double? secondDecorationThickness;
  final TextDecoration? secondTextDecoration;
  final void Function()? onTap;

  const CustomRichText(
      {Key? key,
      this.onTap,
      this.text,
      this.textAlign,
      this.fontSize,
      this.fontHeight,
      this.maxLines,
      this.fontWeight,
      this.textColor,
      this.textDecoration,
      this.secondText,
      this.secondTextAlign,
      this.secondMaxLines,
      this.secondFontSize,
      this.secondFontWeight,
      this.secondFontHeight,
      this.secondTextColor,
      this.secondTextDecoration,
      this.secondDecorationColor,
      this.secondDecorationThickness})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            text: text ?? '',
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, height: fontHeight, decoration: textDecoration, color: textColor ?? AppRepoColors().appWhiteColor),
            children: <TextSpan>[
              TextSpan(
                text: secondText,
                style: TextStyle(
                    fontSize: secondFontSize,
                    fontWeight: secondFontWeight,
                    height: secondFontHeight,
                    decoration: secondTextDecoration,
                    decorationThickness: secondDecorationThickness,
                    decorationColor: secondDecorationColor ?? AppRepoColors().appWhiteColor,
                    color: secondTextColor ?? AppRepoColors().appWhiteColor),
              ),
            ],
          ),
          textAlign: textAlign ?? TextAlign.center,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
      );
}

class NoDataFoundText extends StatelessWidget {
  const NoDataFoundText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          'noDataFoundMessage',
          textAlign: TextAlign.center,
          maxLines: 'noDataFoundMessage'.length,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 5.sp, fontWeight: FontWeight.w500, color: AppRepoColors().appRedColor),
        ),
      );
}

class AppLinkText extends StatelessWidget {
  final bool isSplash;

  const AppLinkText({super.key, this.isSplash = false});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => AppLinkLauncher().launchURl('www.web.com'),
        child: Center(
          child: Text(
            'www.web.com',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 5.sp, fontWeight: FontWeight.w500, color: isSplash ? AppRepoColors().appFontLightGreyColor : AppRepoColors().appFontGreyColor),
          ),
        ),
      );
}
