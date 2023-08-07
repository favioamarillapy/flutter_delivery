import 'package:flutter/material.dart';
import 'package:flutter_delivery/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        "/": (context) => const HomeScreen(),
      },
      theme: _getTheme(),
    );
  }
}

ThemeData _getTheme() {
  return ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
  );
}
