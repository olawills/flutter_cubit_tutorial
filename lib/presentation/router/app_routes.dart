import 'package:flutter/material.dart';
import 'package:flutter_cubit_tutorial/presentation/screens/home_page.dart';
import 'package:flutter_cubit_tutorial/presentation/screens/second_screen.dart';
import 'package:flutter_cubit_tutorial/presentation/screens/third_screen.dart';

class AppRouteSettings {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final homeRoute = MaterialPageRoute(
      builder: (_) => const MyHomePage(title: 'Flutter Cubit HomePage'),
    );
    final secondRoute = MaterialPageRoute(
      builder: (_) => const SecondScreen(
        title: 'Second Screen',
        color: Colors.redAccent,
      ),
    );
    final thirdRoute = MaterialPageRoute(
      builder: (_) =>
          const ThirdScreen(title: 'Second Screen', color: Colors.greenAccent),
    );
    switch (routeSettings.name) {
      case '/':
        return homeRoute;

      case '/second':
        return secondRoute;

      case '/third':
        return thirdRoute;

      default:
        return null;
    }
  }
}
