import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(context.screenRatio * 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last Updated:',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                salesProvider.lastFetched,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last Issued Invoice Number:',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                salesProvider.lastInvoiceNumber,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          Container(
                            height: context.screenHeight / 10,
                            width: context.screenWidth / 7,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xaa321E75).withOpacity(1),
                                    const Color(0xaa6633CC).withOpacity(1)
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(4, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(context.screenRatio * 7)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                              onPressed: () {
                                // salesProvider.changeViewIndex(10);
                                // showDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return BackdropFilter(
                                //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                //         child: AlertDialog.adaptive(
                                //           title: Text(
                                //             'Create new invoice as',
                                //             style: Theme.of(context).textTheme.titleSmall,
                                //           ),
                                //           actions: [
                                //             ElevatedButton(
                                //               onPressed: () {},
                                //               child: Text(
                                //                 'Record Invoice',
                                //                 style: GoogleFonts.ubuntu(
                                //                     fontWeight: FontWeight.w700,
                                //                     color: Colors.white,
                                //                     fontSize: context.screenRatio * 8),
                                //               ),
                                //             ),
                                //             ElevatedButton(
                                //               onPressed: () {},
                                //               child: Text(
                                //                 'Draft Invoice',
                                //                 style: GoogleFonts.ubuntu(
                                //                     fontWeight: FontWeight.w700,
                                //                     color: Colors.white,
                                //                     fontSize: context.screenRatio * 8),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       );
                                //     });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.add_circled_solid,
                                    color: Colors.white,
                                    size: context.screenRatio * 25,
                                  ),
                                  const Spacer(),
                                  FittedBox(
                                    child: Text(
                                      'New Invoice',
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: context.screenRatio * 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                        SizedBox(
                                          width: context.screenWidth * 0.01,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            salesProvider.startFetchingIndicator();
                                            Future.delayed(const Duration(seconds: 3), () {
                                              salesProvider.getAllInvoices(context);
                                              salesProvider.getLastInvoiceNumber(context);
                                              salesProvider.startFetchingIndicator();
                                            });
                                          },
                                          icon: salesProvider.isFetchingIndicator
                                              ? SpinKitSpinningLines(
                                                  color: Colors.blueGrey,
                                                  size: context.screenRatio * 15,
                                                )
                                              : Icon(
                                                  CupertinoIcons.refresh,
                                                  size: context.screenRatio * 15,
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
