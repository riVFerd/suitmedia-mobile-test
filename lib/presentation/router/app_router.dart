import 'package:flutter/material.dart';
import 'package:flutter_suitmedia/presentation/screens/first_screen.dart';
import 'package:flutter_suitmedia/presentation/screens/second_screen.dart';

class AppRouter {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const FirstScreen(),
        );
      case SecondScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
        );
    }
  }
}
