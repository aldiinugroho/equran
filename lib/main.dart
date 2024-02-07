import 'package:equran/constants/providers.dart';
import 'package:equran/routes/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Providers are above [MyApp] instead of inside it, so that tests
    // can use [MyApp] while mocking the providers
    MultiProvider(
      providers: providers,
      child: const App(),
    ),
  );
}

/// The main app.
class App extends StatelessWidget {
  /// Constructs a [App]
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: mainRouter,
    );
  }
}