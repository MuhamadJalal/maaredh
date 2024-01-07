import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/common_widget/barrel_common_widget.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class CustomAppbar extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final String? title;
  final bool isBackButton;
  final bool showMenu;
  final void Function()? onBackButtonTap;

  const CustomAppbar({Key? key, this.title, this.isBackButton = false, this.showMenu = true, this.scaffoldKey, this.onBackButtonTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: AppRepoColors().appPrimaryColor,
        padding: EdgeInsets.fromLTRB(2.sw, 4.5.sh, 2.sw, 2.sh),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showMenu)
              InkWell(
                onTap: () => scaffoldKey?.currentState?.openDrawer(),
                child: Icon(
                  Icons.menu_rounded,
                  size: 7.5.sw,
                ),
              ),
            Expanded(
              child: SizedBox(
                  height: 11.sw,
                  child: title == null
                      ? null
                      : Container(
                          padding: EdgeInsets.only(top: 0.6.sh),
                          alignment: Alignment.center,
                          child: CustomText(
                            text: title!,
                            textAlign: TextAlign.center,
                            fontSize: 4.4.sp,
                            fontWeight: FontWeight.w500,
                            textColor: AppRepoColors().appFontAppbarTitleColor,
                            maxLines: '$title '.length,
                          ),
                        )),
            ),
            isBackButton
                ? CustomBackButton(onTap: onBackButtonTap)
                : Center(
                    child: CustomImageProvider(
                      imagePath: AppRepoAssets().logoImage,
                      boxFit: BoxFit.contain,
                      width: 23.sw,
                      height: 23.sw,
                    ),
                  ),
          ],
        ),
      );
}
