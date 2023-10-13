import 'package:flutter/material.dart';

import '../Widgets/login_form_widget.dart';
import '../Widgets/side_banner_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginFormWidget(),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 500,
                child: VerticalDivider(),
              ),
              SizedBox(
                width: 20,
              ),
              SideBannerWidget()
            ],
          ),
        ),
      ),
    );
  }
}
