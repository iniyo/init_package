import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:init_package/feature/globalcomponent/global_base_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "LoginScreen",
      widgets: [
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('toHome'),
        ),
      ],
    );
  }
}
