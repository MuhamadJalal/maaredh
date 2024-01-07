import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/common_widget/barrel_common_widget.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class CustomTitledTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? titleText;
  final String? hintText;
  final String? fontFamily;
  final bool? isObscureText;
  final bool isValid;
  final bool? isBordered;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final double? fontSize;
  final double? hintFontSize;
  final double? titleFontSize;
  final FontWeight? hintFontWeight;
  final FontWeight? titleFontWeight;
  final double? hintLetterSpacing;
  final Color? textFieldColor;
  final Color? fillColor;
  final Color? textColor;
  final Color? titleTextColor;
  final Color? hintTextColor;
  final Widget? suffixIcon;
  final int? maxLines;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final VoidCallback? onPressVCL;
  final Widget? titlePrefixWidget;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final GlobalKey<FormFieldState>? formKey;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSaved;

  const CustomTitledTextFormField({
    Key? key,
    this.controller,
    this.titleText,
    this.hintText,
    this.fontFamily,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.fontSize,
    this.hintFontSize,
    this.titleFontSize,
    this.hintFontWeight,
    this.titleFontWeight,
    this.hintLetterSpacing,
    this.textFieldColor,
    this.fillColor,
    this.textColor,
    this.titleTextColor,
    this.hintTextColor,
    this.suffixIcon,
    this.maxLines,
    this.focusNode,
    this.onTap,
    this.onPressVCL,
    this.titlePrefixWidget,
    this.contentPadding,
    this.keyboardType,
    this.textAlign,
    this.formKey,
    this.validator,
    this.onChanged,
    this.isObscureText = false,
    required this.isValid,
    this.isBordered = true,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: AppRepoColors().appTransparentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.sw),
              child: CustomText(
                text: titleText ?? '',
                textColor: titleTextColor ?? AppRepoColors().appBlackColor,
                textAlign: TextAlign.start,
                fontSize: titleFontSize ?? 4.4.sp,
                fontWeight: titleFontWeight ?? FontWeight.w400,
              ),
            ),
            SizedBox(height: 1.0.sh),
            CustomRoundedWidgetButton(
              borderRadius: borderRadius ?? AppRepoSizes().circularCornerRadius,
              padding: EdgeInsets.symmetric(horizontal: 4.sw),
              backgroundColor: AppRepoColors().appGreyBackgroundColor,
              border: isBordered!
                  ? Border.all(
                      color: formKey?.currentState?.hasError != null && formKey!.currentState!.hasError ? AppRepoColors().appRedColor : borderColor!,
                      width: borderWidth ?? 0.2.sw,
                    )
                  : null,
              child: TextFormField(
                key: formKey,
                focusNode: focusNode,
                obscureText: isObscureText!,
                controller: controller,
                maxLines: maxLines ?? 1,
                textAlign: textAlign ?? TextAlign.start,
                style: TextStyle(color: textColor, fontSize: fontSize ?? 3.5.sp),
                keyboardType: keyboardType,
                onTap: onTap ?? () {},
                validator: validator,
                onChanged: onChanged,
                onSaved: onChanged,
                onFieldSubmitted: onChanged,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    // helperText: ' ',
                    filled: true,
                    // fillColor: fillColor ?? AppRepoColors().appTransparentColor,
                    fillColor: AppRepoColors().appTransparentColor,
                    counterText: '',
                    contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 2.sw),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: hintText ?? '',
                    hintStyle: TextStyle(
                      color: hintTextColor,
                      fontSize: hintFontSize ?? 4.4.sp,
                      fontWeight: hintFontWeight ?? FontWeight.w300,
                      letterSpacing: hintLetterSpacing,
                      // fontFamily: fontFamily ?? AppRepoAssets().appFontFamily,
                    ),
                    errorMaxLines: 1,
                    errorStyle: TextStyle(
                      color: AppRepoColors().appRedColor,
                      fontSize: 3.3.sp,
                      // fontFamily: fontFamily ?? AppRepoAssets().appFontFamily,
                    ),
                    // border: isBordered!
                    //     ? OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: borderColor!,
                    //             width:
                    //                 borderWidth ?? 0.2.sw),
                    //         borderRadius: borderRadius ??
                    //             AppRepoSizes().smallestCardCornerRadius,
                    //       )
                    //     : InputBorder.none,
                    // enabledBorder: isBordered!
                    //     ? OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: borderColor ??
                    //                 AppRepoColors().appTransparentColor,
                    //             width:
                    //                 borderWidth ?? 0.2.sw),
                    //         borderRadius: borderRadius ??
                    //             AppRepoSizes().smallestCardCornerRadius,
                    //       )
                    //     : InputBorder.none,
                    // disabledBorder: isBordered!
                    //     ? OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: borderColor ??
                    //                 AppRepoColors().appTransparentColor,
                    //             width:
                    //                 borderWidth ?? 0.2.sw),
                    //         borderRadius: borderRadius ??
                    //             AppRepoSizes().smallestCardCornerRadius,
                    //       )
                    //     : InputBorder.none,
                    // focusedBorder: isBordered!
                    //     ? OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: borderColor ??
                    //                 AppRepoColors().appTransparentColor,
                    //             width:
                    //                 borderWidth ?? 0.2.sw),
                    //         borderRadius: borderRadius ??
                    //             AppRepoSizes().smallestCardCornerRadius,
                    //       )
                    //     : InputBorder.none,
                    // errorBorder: OutlineInputBorder(
                    //     borderRadius: borderRadius ??
                    //         AppRepoSizes().smallestCardCornerRadius,
                    //     borderSide: BorderSide(
                    //         color: AppRepoColors().appRedColor,
                    //         width: 0.1.sw)),
                    suffixIcon: suffixIcon != null
                        ? IconButton(
                            onPressed: onPressVCL,
                            icon: suffixIcon ?? const Icon(Icons.error),
                          )
                        : const SizedBox()),
              ),
            ),
          ],
        ),
      );
}
