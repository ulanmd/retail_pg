import 'package:flutter/material.dart';

class SmallLayout extends StatefulWidget {
  const SmallLayout({Key? key}) : super(key: key);

  @override
  State<SmallLayout> createState() => _SmallLayoutState();
}

class _SmallLayoutState extends State<SmallLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Small'),
      ),
    );
  }
}
