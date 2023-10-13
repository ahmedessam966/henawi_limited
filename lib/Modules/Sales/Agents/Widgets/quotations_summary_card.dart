import 'package:flutter/material.dart';
import 'package:henawi_limited/Modules/Sales/Agents/Controllers/sales_agent_controller.dart';
import 'package:henawi_limited/providers.dart';
import 'package:provider/provider.dart';

class QuotationsSummaryCard extends StatelessWidget {
  const QuotationsSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SalesAgentController, AuthenticationServices>(
        builder: (context, salesProvider, authProvider, _) {
      salesProvider.getUserQuotations(authProvider.currentUserModel!.userName, context);
      return const Row(
        children: [],
      );
    });
  }
}
