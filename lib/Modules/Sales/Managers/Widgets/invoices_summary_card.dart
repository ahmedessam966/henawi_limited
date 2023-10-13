import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Controllers/sales_manager_controller.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:provider/provider.dart';
import '../../../../Services/API/authentication_services.dart';
import 'invoice_expansion_tile.dart';
import 'vertical_nav_bar_widget.dart';

class InvoicesSummaryCard extends StatelessWidget {
  const InvoicesSummaryCard({super.key});

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
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: context.screenHeight * 0.7,
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(context.screenRatio * 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          CupertinoIcons.square_list_fill,
                                        ),
                                        SizedBox(
                                          width: context.screenWidth * 0.01,
                                        ),
                                        Text(
                                          'Viewing Recorded Invoices',
                                          style: Theme.of(context).textTheme.titleLarge,
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Jump to pending',
                                            style: Theme.of(context).textTheme.labelMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Text(
                                      'Invoice Totals Shown Are VAT INCLUSIVE',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) => Divider(
                                          indent: context.screenWidth * 0.025,
                                        ),
                                        itemCount: salesProvider.allInvoicesList.length,
                                        itemBuilder: (context, index) {
                                          final invoice = salesProvider.allInvoicesList[index];
                                          return InvoiceExpansionTile(index: index, invoice: invoice);
                                        },
                                      ),
                                    ),
                                    salesProvider.isFetchingIndicator
                                        ? SpinKitCircle(
                                            color: Colors.black,
                                            size: context.screenRatio * 20,
                                          )
                                        : TextButton(
                                            onPressed: () {
                                              salesProvider.startFetchingIndicator();
                                              salesProvider.fetchMoreInvoices(context);
                                              salesProvider.startFetchingIndicator();
                                            },
                                            child: const Text('Show More...'),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
