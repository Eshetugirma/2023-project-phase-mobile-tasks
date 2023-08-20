import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import 'to_do_lists.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          // background image
          Center(
            child: Image.asset('assets/image1.png'),
          ),

          // get started button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: CustomButton(
                label: 'Get started',
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  Navigator.pushNamed(context, TaskListScreen.routeName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
