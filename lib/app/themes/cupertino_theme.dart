

import 'package:base_statewidget/app/themes/app_brightness.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final cupertinoTheme = CupertinoThemeData(
      brightness: brightness, // if null will use the system theme
      // ignore: prefer_const_constructors
      primaryColor: CupertinoDynamicColor.withBrightness(
        color: Colors.purple,
        darkColor: Colors.cyan,
      ),
);