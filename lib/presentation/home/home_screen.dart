import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/widget/home_elements.dart';
import 'package:todo_app/presentation/home/widget/positioned_container.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          HomeElements(),
          Positioned(
            top: -30,
            left: -40,
            child: PositionedContainer(),
          ),
          Positioned(
            top: -90,
            right: -90,
            child: PositionedContainer(),
          ),
          Positioned(
            bottom: 30,
            left: -90,
            child: PositionedContainer(),
          ),
          Positioned(
            bottom: -80,
            right: -80,
            child: PositionedContainer(),
          ),
        ],
      ),
    );
  }
}
