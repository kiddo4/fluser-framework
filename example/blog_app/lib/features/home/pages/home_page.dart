import 'package:fluser/client/core/hydration_controller.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hydrationController =
        HydrationController({}); // Pass the initial state

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await hydrationController.hydrateApp(context);
            // Additional logic after hydration
          },
          child: const Text('Hydrate App'),
        ),
      ),
    );
  }
}
