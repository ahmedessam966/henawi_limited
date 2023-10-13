import 'package:flutter/material.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Widgets/invoices_summary_card.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Widgets/sales_summary_card.dart';
import 'package:henawi_limited/Modules/Sales/Shared/Widgets/new_invoice_widget.dart';
import 'package:henawi_limited/providers.dart';
import 'package:provider/provider.dart';

import '../../Shared/Widgets/horizontal_nav_bar_widget.dart';

class SalesManagerScreen extends StatelessWidget {
  final int initialViewIndex;
  const SalesManagerScreen({super.key, required this.initialViewIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthenticationServices, SalesManagerController>(
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
                          return const ManagerSalesSummaryCard();
                        case 1:
                          return Container();
                        case 2:
                          return const InvoicesSummaryCard();
                        case 3:
                          return Container();
                        case 4:
                          return Container();
                        case 5:
                          return Container();
                        case 10:
                          return NewInvoiceWidget(salesProvider: salesProvider, authProvider: authProvider);
                        default:
                          return const Text('data');
                      }
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
