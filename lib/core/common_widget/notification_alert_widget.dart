import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/core/common_widget/barrel_common_widget.dart';
import 'package:maaredh/core/common_widget/common_text.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class NotificationAlert extends StatelessWidget {
  final RemoteNotification? notificationModel;

  const NotificationAlert({Key? key, this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoAlertDialog(
        title: Material(
          color: AppRepoColors().kDialogColor,
          child: CustomText(
            text: notificationModel?.title ?? '',
            textColor: AppRepoColors().appFontBlackColor,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontSize: 5.0.sp,
            maxLines: '${notificationModel?.title} '.length,
          ),
        ),
        content: Material(
          color: AppRepoColors().kDialogColor,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 2.sh),
                  child: CustomText(
                    text: notificationModel?.body ?? '',
                    textColor: AppRepoColors().appFontBlackColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    fontSize: 4.0.sp,
                    maxLines: '${notificationModel?.body} '.length,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Material(
            color: AppRepoColors().kDialogColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.sh),
              child: CustomText(
                onTap: () => Navigator.pop(context),
                text: 'cancel'.capitalize(),
                textColor: AppRepoColors().appFontBlackColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                fontSize: 5.0.sp,
              ),
            ),
          ),
          Material(
            color: AppRepoColors().kDialogColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.sh),
              child: CustomText(
                onTap: () {
                  if ((notificationModel?.android != null && notificationModel!.android!.toString().isNotEmpty) ||
                      (notificationModel?.apple != null && notificationModel!.apple!.toString().isNotEmpty)) {
                    'NotificationAlert notificationModel?.android?.link ${notificationModel?.android?.link}'.debug('static this');
                    'NotificationAlert notificationModel?.apple?.imageUrl ${notificationModel?.apple?.imageUrl}'.debug('static this');
                    'await flutterLocalNotificationsPlugin. NotificationAlert ${notificationModel?.android?.link ?? notificationModel?.apple?.imageUrl}'.debug(this);
                    String? webTitle = notificationModel?.title;
                    String? webLink = notificationModel?.android?.link ?? notificationModel?.apple?.imageUrl;
                    'await flutterLocalNotificationsPlugin. webTitle $webTitle  webLink $webLink '.debug(this);
                  }
                },
                text: 'submit'.capitalize(),
                textColor: AppRepoColors().appFontGreenColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                fontSize: 5.0.sp,
              ),
            ),
          )
        ],
      );
}
