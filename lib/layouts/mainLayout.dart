import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget smallBody;
  final Widget mediumBody;
  final Widget largeBody;

  const MainLayout({
    required this.smallBody,
    required this.mediumBody,
    required this.largeBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 660) {
          return smallBody;
        }else if (constraints.maxWidth < 880) {
          return mediumBody;
        } else {
          return largeBody;
        }
      },
    );
  }
}