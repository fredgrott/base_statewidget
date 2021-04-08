import 'package:base_statewidget/app/modules/home_page/views/my_home_page.dart';
import 'package:base_statewidget/app/themes/app_brightness.dart';
import 'package:base_statewidget/app/themes/cupertino_theme.dart';
import 'package:base_statewidget/app/themes/material_dark_theme.dart';
import 'package:base_statewidget/app/themes/material_theme.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';




class MyAppPlatformExp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseStateWidgetApp();
}

// Required, as we need to put both Google's Platform provider and
// FlutterPlatformWidgets platform provider interface in a
// stateful widget to receive the change theme,brightness, and
// contrast event state changes.
class BaseStateWidgetApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<BaseStateWidgetApp> {
  
  @override
  Widget build(BuildContext context) {

    
    return Theme(
      // an easy way to do if statements, condition true-value false value
      data: brightness == Brightness.light ? materialTheme : materialDarkTheme,
      child: PlatformProvider(
        //cheap way to see iOS on android emulator is to set something here such as,
        
        // PlatformApp cannot have  a const prefix
        // as than cannot use _ and __ for BuildContext and PlatformTarget
        // as it will give invalid constant errors
        builder: (context) => PlatformApp(
          debugShowCheckedModeBanner: false,
          // ignore: prefer_const_literals_to_create_immutables
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Base StateWidget',
          material: (_, __) {
            return MaterialAppData(
              theme: materialTheme,
              darkTheme: materialDarkTheme,
              themeMode: brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          cupertino: (_, __) => CupertinoAppData(
            theme: cupertinoTheme,
          ),
          home: MyHomePagePlatformExp(() {
            setState(() {
              brightness = brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light;
            });
          }),
          

        )
      )
    );
  }
}
