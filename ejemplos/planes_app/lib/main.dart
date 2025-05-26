import 'package:flutter/material.dart';
import 'plan_screen.dart';

void main() => runApp(const PlanApp());

class PlanApp extends StatelessWidget {
  const PlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlanScreen(),
    );
  }
}
