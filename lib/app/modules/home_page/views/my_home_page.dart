import 'package:base_statewidget/app/common/logging/log_pens.dart';
import 'package:base_statewidget/app/common/logging/logger_types.dart';
import 'package:base_statewidget/app/themes/my_cupertino_navigation_bar_data.dart';
import 'package:base_statewidget/app/themes/my_cupertino_page_scaffold_data.dart';
import 'package:base_statewidget/app/themes/my_material_app_bar_data.dart';
import 'package:base_statewidget/app/themes/my_material_scaffold_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyHomePagePlatformExp extends StatefulWidget {
   MyHomePagePlatformExp(this.toggleBrightness, );

  

  final void Function() toggleBrightness;

  @override
  MyHomePagePlatformExpState createState() => MyHomePagePlatformExpState();
}

class MyHomePagePlatformExpState extends State<MyHomePagePlatformExp>
    with UiLogger {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      logger.info(penInfo("counter incremented by 1"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        material: (
          _,
          __,
        ) =>
            myMaterialScaffoldData,
        cupertino: (
          _,
          __,
        ) =>
            myCupertinoPageScaffoldData,
        appBar: PlatformAppBar(
          title: PlatformText('Base StateWidget'),
          material: (
            _,
            __,
          ) =>
              myMaterialAppBarData,
          cupertino: (_, __) => myCupertinoNavigationBarData,
          trailingActions: <Widget>[
            PlatformIconButton(
              padding: EdgeInsets.zero,
              icon: Icon(context.platformIcons.share),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          // Usually a better layout plan includes both the Parent Safe Widget and
          // a child Stack Widget as the container to hold a typical screen layout.
          // The main thing is that we have to have a Stack Widget to properly do
          // background images as the Stack container has to be close
          // in parent-child relationship to the scaffold widget.
          // Plus,the stack widget has a children attribute to allow
          // us to add all our simulated FABs etc.
          //
          // A core gist fundamental is that we sue specific widgets to
          // group like widgets than need to be positionally grouped
          // together. i.e. column and row widgets, etc.
          //
          // IMHO the best layout cheatsheet is the one at:
          // https://github.com/TakeoffAndroid/flutter-examples
          // which was created by Chandrasekar Kuppusamy
          child: Stack(children: <Widget>[
            // sets the background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 10.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PlatformText(
                      'You have pushed the button this many times:',
                    ),
                    PlatformText(
                      '$_counter',
                    ),
                  ],
                )),
            Positioned(
                bottom: 4,
                right: 4,
                child: PlatformIconButton(
                  onPressed: _incrementCounter,
                  padding: EdgeInsets.zero,
                  icon: Icon(context.platformIcons.addCircledSolid),
                ))
          ]),
        ));
  }
}
