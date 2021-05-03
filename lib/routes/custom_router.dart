
import 'package:firebaseflutter/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name){

      case LoginRoute:
        return MaterialPageRoute(builder: (_) => login());
      // case WrapperRoute:
      //   return MaterialPageRoute(builder: (_) => Wrapper());
      // case homeRoute:
      //   return MaterialPageRoute(builder: (_) => home());
      // case RegisterRoute:
      //   return MaterialPageRoute(builder: (_) => Register());
      // // case SensorRoute:
      // //   return MaterialPageRoute(builder: (_) => Sensor());
      // case ResetRoute:
      //   return MaterialPageRoute(builder: (_) => Reset());




    }
    // return MaterialPageRoute(builder: (_) => NoPageFound());
  }
}
