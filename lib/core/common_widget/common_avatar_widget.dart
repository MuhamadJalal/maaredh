import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/common_widget/barrel_common_widget.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class UserAvatarWidget extends StatelessWidget {
  final String? imagePath;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final void Function()? onTap;
  final bool? isEditable;

  const UserAvatarWidget({Key? key, this.imagePath, this.boxFit, this.height, this.width, this.onTap, this.isEditable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 30.sw,
                height: 30.sw,
                alignment: Alignment.center,
                child: ClipOval(
                    child: Container(
                        color: AppRepoColors().appWhiteColor,
                        child: imagePath != null && imagePath!.startsWith('http')
                            ? Image.network(
                                imagePath!, // ?.fromBase64(),
                                fit: boxFit ?? BoxFit.scaleDown,
                                width: 25.sw,
                                height: 25.sw,
                                errorBuilder: (context, object, stackTrace) => CustomImageProvider(imagePath: AppRepoAssets().logoImage, boxFit: BoxFit.fill),
                              )
                            : CustomImageProvider(
                                imagePath: AppRepoAssets().logoImage,
                                boxFit: boxFit ?? BoxFit.scaleDown,
                                width: 25.sw,
                                height: 25.sw,
                              ))),
              ),
            ],
          ),
        ),
      );
}
