import 'package:flutter/material.dart';
import 'package:flutter_delivery/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          const CustomAppBar(),
          const PromotioCard(),
          CategoryList(),
        ],
      ),
    );
  }
}
