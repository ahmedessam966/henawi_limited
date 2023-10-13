import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Services/API/authentication_services.dart';
import '../../Shared/Widgets/horizontal_nav_bar_widget.dart';
import '../Controllers/sales_agent_controller.dart';

class SalesAgentScreen extends StatelessWidget {
  final int initialViewIndex;
  const SalesAgentScreen({super.key, required this.initialViewIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthenticationServices, SalesAgentController>(
        builder: (context, authProvider, salesProvider, _) {
      return Expanded(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              const HorizontalNavBarWidget(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Builder(builder: (context) {
                      int index = salesProvider.viewIndex;
                      switch (index) {
                        case 0:
                          return Container();
                        case 1:
                          return Container();
                        case 2:
                          return Container();
                        case 4:
                          return Container();
                        default:
                          return const Text('data');
                      }
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
