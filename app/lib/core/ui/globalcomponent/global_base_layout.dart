import 'package:flutter/material.dart';
import 'package:init_package/core/core.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({required this.title, required this.widgets, super.key});

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets,
          ),
        ),
      ),
    );
  }
}
