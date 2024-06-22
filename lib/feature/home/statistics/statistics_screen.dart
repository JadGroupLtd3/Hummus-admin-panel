import 'package:flutter/material.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
    );
  }
}
