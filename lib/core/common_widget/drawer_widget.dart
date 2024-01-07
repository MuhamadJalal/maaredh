import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/common_widget/barrel_common_widget.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: AppRepoColors().appPrimaryColor,
        elevation: 2.0,
        shape: const ContinuousRectangleBorder(),
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            // CommonBackgroundWidget(),
            Column(
              children: [
                SizedBox(height: 4.sh),
                DrawerListTileItem(
                  onTap: () {},
                  title: '',
                  isBordered: false,
                  leading: CustomText(
                    text: 'title',
                    fontSize: 5.0.sp,
                    fontWeight: FontWeight.w400,
                    textColor: AppRepoColors().appFontWhiteColor,
                    textAlign: TextAlign.start,
                  ),
                  trailing: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close_rounded, color: AppRepoColors().appFontWhiteColor, size: 7.sw),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(onTap: () {}, child: CustomImageProvider(imagePath: AppRepoAssets().logoImage, width: 25.sw, height: 25.sw, boxFit: BoxFit.fill)),
                        SizedBox(height: 1.sh),
                        InkWell(
                          onTap: () {},
                          child: CustomText(
                            text: 'data'.capitalize(),
                            // text: (controller.userModel.value?.userName ?? '').capitalize(),
                            fontSize: 4.5.sp,
                            fontWeight: FontWeight.w400,
                            textColor: AppRepoColors().appFontWhiteColor,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(height: 2.sh),
                        Divider(thickness: 0.03.sw, color: AppRepoColors().appWhiteColor),
                        SizedBox(height: 10.sh),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
}

class DrawerListTileItem extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String? leadingIcon;
  final Widget? leading;
  final Widget? trailing;
  final bool? isBordered;

  const DrawerListTileItem({
    Key? key,
    required this.onTap,
    required this.title,
    this.leadingIcon,
    this.leading,
    this.trailing,
    this.isBordered = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.sw),
          padding: EdgeInsets.symmetric(horizontal: 1.sw, vertical: 2.sh),
          decoration: !isBordered! ? null : BoxDecoration(border: Border(bottom: BorderSide(width: 0.04.sw))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ?? (leadingIcon == null ? const SizedBox() : CustomImageProvider(imagePath: leadingIcon!, width: 7.sw, height: 7.sw)),
              leading == null && leadingIcon == null ? const SizedBox() : SizedBox(width: 4.sw),
              Expanded(
                child: CustomText(
                  text: title.capitalize(),
                  fontSize: 4.5.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppRepoColors().appFontWhiteColor,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(width: 4.sh),
              trailing ?? Icon(Icons.navigate_next, color: AppRepoColors().appFontWhiteColor, size: 7.sw),
            ],
          ),
        ),
      );
}
