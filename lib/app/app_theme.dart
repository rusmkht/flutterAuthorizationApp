import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoThemeData appTheme = const CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    navTitleTextStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  ),
);

CupertinoThemeData appDarkTheme = const CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    navTitleTextStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  ),
);
