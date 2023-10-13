import 'package:flutter/material.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Controllers/sales_manager_controller.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:provider/provider.dart';

import '../../../../Services/API/authentication_services.dart';
import 'vertical_nav_bar_widget.dart';

class SalesReportCard extends StatelessWidget {
  const SalesReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SalesManagerController, AuthenticationServices>(
        builder: (context, salesProvider, authProvider, _) {
      salesProvider.getAllInvoices(context);
      return Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalNavBarWidget(),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: context.screenHeight * 0.4,
                      child: const Card(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
