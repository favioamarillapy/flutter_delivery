import 'package:flutter/material.dart';
import 'package:flutter_delivery/providers/providers.dart';
import 'package:flutter_delivery/screens/screens.dart';
import 'package:flutter_delivery/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ],
        child: const DeliveryApp(),
      ),
    );

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      //initialRoute: "/tracking",
      routes: {
        "/": (context) => const HomeScreen(),
        "/product-detail": (context) => const ProductDetailScreen(),
        "/tracking": (context) => const TrackingScreen(),
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: themePrimaryColor,
    ),
  );
}
