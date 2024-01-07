import 'package:flutter/material.dart';

class GlobalContext {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext context() => navigatorKey.currentContext!;
}
