import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/core/service_locator.dart';
import 'package:wallpaper_app/presentation/controllers/search_provider.dart';
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
        return screen(_home());
      case Routes.search:
        return screen(_search());

      default:
        return screen(const Scaffold());
    }
  }

  static screen(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }

  static _home() {
    return const HomeScreen();
  }

  static _search() {
    setupSearchService();
    return ChangeNotifierProvider(
      create: (context) => getIt<SearchProvider>()..start(),
      child: const SearchScreen(),
    );
  }
}
