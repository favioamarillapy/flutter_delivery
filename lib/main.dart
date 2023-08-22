import 'package:flutter/material.dart';
import 'package:flutter_delivery/helpers/DatabaseHelper.dart';
import 'package:flutter_delivery/providers/providers.dart';
import 'package:flutter_delivery/screens/screens.dart';
import 'package:flutter_delivery/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => PromotionProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const DeliveryApp(),
    ),
  );

  final dbHelper = DatabaseHelper();
  if (await dbHelper.queryRowCountPromotion() == 0) {
    await dbHelper.insertPromotion({
      "title": "Discounts on electronics",
      "subtitle": "",
      "discount": "20",
      "image":
          "https://nissei.com/media/catalog/product/cache/16a9529cefd63504739dab4fc3414065/h/p/hp_15-ef2729wm_-_1.jpg"
    });

    await dbHelper.insertPromotion({
      "title": "Discounts on Men's",
      "subtitle": "",
      "discount": "30",
      "image":
          "https://www.mrporter.com/variants/images/3633577411310824/in/w2000_q60.jpg"
    });

    await dbHelper.insertPromotion({
      "title": "Discounts on Women's",
      "subtitle": "",
      "discount": "40",
      "image":
          "https://www.mrporter.com/variants/images/3633577411310824/in/w2000_q60.jpg"
    });
  }
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
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
