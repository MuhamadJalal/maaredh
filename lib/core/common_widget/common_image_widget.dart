import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class CustomImageProvider extends StatelessWidget {
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final String imagePath;
  final BorderRadius? borderRadius;
  final void Function()? onTap;
  final bool? isBorderRadius;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final Widget? child;

  const CustomImageProvider(
      {Key? key, this.boxFit, this.height, this.width, required this.imagePath, this.borderRadius, this.onTap, this.isBorderRadius = true, this.margin, this.alignment, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          margin: margin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: isBorderRadius! ? borderRadius : null,
            color: AppRepoColors().appTransparentColor,
            image: DecorationImage(
              image: (imagePath.isEmpty
                  ? AssetImage(AppRepoAssets().logoImage)
                  : imagePath.startsWith('http')
                      ? NetworkImage(imagePath)
                      : imagePath.startsWith('asset')
                          ? AssetImage(imagePath)
                          : FileImage((File(imagePath)))) as ImageProvider,
              fit: boxFit ?? BoxFit.fill,
              onError: (Object exception, StackTrace? stackTrace) => Icon(Icons.image, color: AppRepoColors().appRedColor.withOpacity(0.3), size: 20.sw),
            ),
          ),
          child: child,
        ),
      );
}

// class CustomSVGImageProvider extends StatelessWidget {
//   final BoxFit? boxFit;
//   final double? height;
//   final double? width;
//   final String imagePath;
//   final void Function()? onTap;
//   final EdgeInsets? margin;
//   final Alignment? alignment;
//   final Color? iamgeColor;
//
//   const CustomSVGImageProvider({
//     Key? key,
//     this.boxFit,
//     this.height,
//     this.width,
//     required this.imagePath,
//     this.onTap,
//     this.margin,
//     this.alignment,
//     this.iamgeColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => GestureDetector(
//     onTap: onTap,
//     child: Container(
//       height: height,
//       width: width,
//       margin: margin,
//       alignment: alignment ?? Alignment.center,
//       child: imagePath.startsWith('asset')
//           ? SvgPicture.asset(
//               imagePath,
//               fit: boxFit ?? BoxFit.fill,
//         height: height,
//         width: width,
//         color: iamgeColor,
//         placeholderBuilder: (context) => Icon(Icons.image,
//                   color: AppRepoColors().appRedColor.withOpacity(0.3),
//                   size: 20.sw),
//             )
//           : imagePath.startsWith('http')
//               ? SvgPicture.network(
//                   imagePath,
//                   fit: boxFit ?? BoxFit.fill,
//         height: height,
//         width: width,
//         placeholderBuilder: (context) => Icon(Icons.image,
//                       color: AppRepoColors().appRedColor.withOpacity(0.3),
//                       size: 20.sw),
//                 )
//               : SvgPicture.file(
//                   File(imagePath),
//                   fit: boxFit ?? BoxFit.fill,
//         height: height,
//         width: width,
//         placeholderBuilder: (context) => Icon(Icons.image,
//                       color: AppRepoColors().appRedColor.withOpacity(0.3),
//                       size: 20.sw),
//                 ),
//     ),
//   );
// }
