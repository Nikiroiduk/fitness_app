import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
