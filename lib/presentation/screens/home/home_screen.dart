import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app/core/service_locator.dart';
import 'package:wallpaper_app/presentation/controllers/home_provider.dart';
import 'package:wallpaper_app/presentation/screens/home/widgets/home_body.dart';
import 'package:wallpaper_app/presentation/widgets/back_to_top_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<HomeProvider>()..start(),
      child: Scaffold(
        body: const SafeArea(
          child: HomeBody(),
        ),
        floatingActionButton: Builder(builder: (ctx) {
          return BackToTopButton(
            scrollController: ctx.read<HomeProvider>().scrollController,
          );
        }),
      ),
    );
  }
}
