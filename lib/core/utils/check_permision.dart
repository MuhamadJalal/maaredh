import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission(Permission permission) async {
  // permission.isGranted.then((isGranted) {
  //   if (isGranted)
  //     return true;
  //   else {
  //
  //   }
  // });
  final status = await permission.request();

  debugPrint('\n\n\n status $status --- status.isGranted ${status.isGranted}\n\n\n');
  return status.isGranted;
}
