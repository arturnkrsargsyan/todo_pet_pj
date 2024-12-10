import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/presentation/core/consts/typography.dart';
import 'package:todo_app/presentation/core/router/router.dart';
import 'package:todo_app/presentation/home/widget/button.dart';

class HomeElements extends StatelessWidget {
  const HomeElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            Assets.images.homeImg.path,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const Text(
            'Welcome',
            style: AppTypography.s25w6h20,
          ),
          const Spacer(),
          Button(
            bottonText: 'Get Started',
            buttonFunction: () {
              context.router.push(const LoginRoute());
            },
          ),
          const Spacer(),
        ],
      ),
    ));
  }
}
