
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as Http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'Dependenci Injection/getx Injection/getx_dependenci_injection.dart';
import 'Dependenci Injection/init_dependencies.dart';

import 'core/config/theme/app_themes.dart';
import 'core/routes/routes.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  ///dp path
  var databasePath = await getApplicationDocumentsDirectory();
  Hive.init(databasePath.path);
  Box? box= await Hive.openBox('users');


  ///status bar style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
  ));

  await init();
  await initDependencies();


  runApp(
    const MyApp(),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      // splitScreenMode: true,
      builder: (context, child) => GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Github issue',
        theme: CustomTheme.darkTheme,
        // darkTheme:CustomTheme.darkTheme, // standard dark theme
        themeMode: ThemeMode.dark,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
