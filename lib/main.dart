import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail_pg/evrika_colors.dart';
import 'package:retail_pg/layouts/largeLayout.dart';
import 'package:retail_pg/layouts/mediumLayout.dart';
import 'package:retail_pg/layouts/smallLayout.dart';
import 'package:retail_pg/store/orderStore.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:window_manager/window_manager.dart';

import 'layouts/mainLayout.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff029aad, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: EvrikaColors.kPrimaryColor, //10%
      100:EvrikaColors.kPrimaryColor, //20%
      200: EvrikaColors.kPrimaryColor, //30%
      300: EvrikaColors.kPrimaryColor, //40%
      400: EvrikaColors.kPrimaryColor, //50%
      500: EvrikaColors.kPrimaryColor, //60%
      600: EvrikaColors.kPrimaryColor, //70%
      700: EvrikaColors.kPrimaryColor, //80%
      800: EvrikaColors.kPrimaryColor, //90%
      900: EvrikaColors.kPrimaryColor, //100%
    },
  );
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(1080, 600),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      minimumSize: Size(1080, 600),
      maximumSize: Size(1920, 1080));
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => Order())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Palette.kToDark),
        home: const MainLayout(
          smallBody: SmallLayout(),
          mediumBody: MediumLayout(),
          largeBody: LargeLayout(),
        ),
      ),
    );
  }
}
