import 'package:flutter/material.dart';
import 'package:init_package/core/constants/app_constants.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({required this.widgets, super.key});

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: widgets,
        ),
      ),
    );
  }
}
