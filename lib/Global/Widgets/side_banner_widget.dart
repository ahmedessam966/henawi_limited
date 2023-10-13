import 'package:flutter/material.dart';

class SideBannerWidget extends StatelessWidget {
  const SideBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 350,
      child: Image.asset(
        'assets/images/logo-no-background.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
