import 'package:flutter/material.dart';

import 'package:wallpaper_app/presentation/screens/favourite/favourite_screen.dart';

import 'package:wallpaper_app/presentation/screens/home/home_screen.dart';

import 'package:wallpaper_app/presentation/screens/search/search_screen.dart';

class Routes {
  static const home = "/home";
  static const search = "/search";
  static const favourites = "/favourites";
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return screen(const HomeScreen());
      case Routes.search:
        return screen(const SearchScreen());
      case Routes.favourites:
        return screen(const FavourtiteScreen());

      default:
        return screen(const Scaffold());
    }
  }

  static MaterialPageRoute screen(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
