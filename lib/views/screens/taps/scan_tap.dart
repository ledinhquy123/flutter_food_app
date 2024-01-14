import 'package:flutter/material.dart';

class ScanTap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanTapState();
}

class _ScanTapState extends State<ScanTap> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Scan'
        ),
      ),
    );
  }
}