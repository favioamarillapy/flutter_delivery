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
      //initialRoute: "/product-detail",
      routes: {
        "/": (context) => const HomeScreen(),
        "/product-detail": (context) => const ProductDetailScreen(),
      },
      theme: _getTheme(),
    );
  }
}

ThemeData _getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 246, 246, 246),
    fontFamily: "Arial",
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(254, 78, 2, 1),
    ),
  );
}
