import 'package:flutter/material.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class CustomRoundedWidgetButton extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback? onTap;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;
  final Duration? duration;
  final Curve? curve;

  const CustomRoundedWidgetButton({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.margin,
    this.padding,
    this.onTap,
    this.border,
    this.alignment,
    this.duration,
    this.curve,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          margin: margin ?? EdgeInsets.zero,
          padding: padding ?? EdgeInsets.zero,
          width: width,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(
              color: backgroundColor ?? AppRepoColors().appTransparentColor,
              borderRadius: borderRadius,
              border: // borderRadius == null || (borderRadius != null && borderRadius == AppRepoSizes().circularCornerRadius) ?
                  border // : null
              ),
          duration: duration ?? const Duration(seconds: 1),
          curve: curve ?? Curves.easeInOut,
          child: child,
        ),
      );
}
