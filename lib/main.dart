import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseflutter/cart_provider.dart';
import 'package:firebaseflutter/cart_screen.dart';
import 'package:firebaseflutter/home2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';

import 'login.dart';


 void main() => runApp(ChangeNotifierProvider(create:(context)=>CartProvider(),child: MyApp()));

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp( DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(),
//   ),);
// }

// void main() async =>
//
//     runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(),
//       ),
//     );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        // onGenerateRoute: CustomRouter.allRoutes,
        // initialRoute: splashRoute,
        home: Home());
  }
}
