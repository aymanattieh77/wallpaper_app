import 'package:flutter/material.dart';
import 'package:wallpaper_app/presentation/screens/home/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
