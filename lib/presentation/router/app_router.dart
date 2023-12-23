import 'package:flutter/material.dart';
import 'package:flutter_suitmedia/presentation/screens/first_screen.dart';
import 'package:flutter_suitmedia/presentation/screens/second_screen.dart';
import 'package:flutter_suitmedia/presentation/screens/third_screen.dart';

class AppRouter {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const FirstScreen(),
        );
      case SecondScreen.routeName:
        final name = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => SecondScreen(name: name),
        );
      case ThirdScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
        );
    }
  }
}
