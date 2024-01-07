import 'package:flutter/material.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

extension Strings on String {
  String firstLetters() {
    if (isEmpty) {
      return 'N/A';
    } else {
      if (!contains(' ')) {
        return this[0];
      }

      if (length < indexOf(' ') + 1) {
        return this[0];
      }

      if (length > indexOf(' ') + 1) {
        return '${this[0]} ${this[indexOf(' ') + 1]}';
      }
    }
    return this[0];
  }

  Color firstLetterColor() {
    if (isEmpty) {
      return const Color(0xff636363);
    } else {
      if (RegExp(r'^[0-9_\-=@,\.;]+$').hasMatch(this) || Validator().isNumeric(this)) {
        return const Color(0xff636363);
      } else {
        switch (this) {
          case 'a':
            return const Color(0xfff05a09);
          case 'b':
            return const Color(0xff6084aa);
          case 'c':
            return const Color(0xff6ae74d);
          case 'd':
            return const Color(0xff3083dc);
          case 'e':
            return const Color(0xff843c3c);
          case 'f':
            return const Color(0xff87a301);
          case 'g':
            return const Color(0xff30dcba);
          case 'h':
            return const Color(0xfffda3a3);
          case 'i':
            return const Color(0xff5c1184);
          case 'j':
            return const Color(0xff86a711);
          case 'k':
            return const Color(0xffff0000);
          case 'l':
            return const Color(0xffa18c07);
          case 'm':
            return const Color(0xff20de5f);
          case 'n':
            return const Color(0xffff007e);
          case 'o':
            return const Color(0xffcb30dc);
          case 'p':
            return const Color(0xff2d343b);
          case 'q':
            return const Color(0xffdc308f);
          case 'r':
            return const Color(0xff0c335c);
          case 's':
            return const Color(0xff175f06);
          case 't':
            return const Color(0xff82f3b3);
          case 'u':
            return const Color(0xff344f6c);
          case 'v':
            return const Color(0xff762d55);
          case 'w':
            return const Color(0xff30dc83);
          case 'x':
            return const Color(0xff314357);
          case 'y':
            return const Color(0xff061e38);
          case 'z':
            return const Color(0xff580f08);
        }
      }
    }
    return const Color(0xff636363);
  }

  String capitalize() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
