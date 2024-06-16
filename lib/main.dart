import 'package:flutter/material.dart';
import 'package:tree_view_application/src/features/home/presentation/pages/home_view.dart';

void main() {
  runApp(const Tractian());
}

class Tractian extends StatelessWidget {
  const Tractian({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TRACTIAN',
      home: HomeView(),
    );
  }
}
