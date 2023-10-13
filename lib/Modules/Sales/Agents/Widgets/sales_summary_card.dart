import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:henawi_limited/Modules/Sales/Agents/Controllers/sales_agent_controller.dart';
import 'package:henawi_limited/Modules/Sales/Agents/Screens/sales_agent_screen.dart';
import 'package:henawi_limited/providers.dart';
import 'package:provider/provider.dart';

import '../../../../Services/Local/routing_transition_services.dart';
import 'sales_item_tile_widget.dart';

class SalesSummaryCard extends StatelessWidget {
  const SalesSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SalesAgentController, AuthenticationServices>(
        builder: (context, salesProvider, authProvider, _) {
      salesProvider.getUserSales(authProvider.currentUserModel!.userName, context);
      return Card(
        child: SizedBox(
          height: 550,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long_rounded,
                      color: const Color(0xaa072e33).withOpacity(1),
                      size: 35,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Your Recorded Invoices', style: Theme.of(context).textTheme.titleLarge),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Jump To Draft Invoices',
                          style: Theme.of(context).textTheme.labelMedium,
                        )),
                  ],
                ),
                //////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                //////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 600,
                      height: 55,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        cursorColor: Colors.black,
                        controller: salesProvider.searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          suffix: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Go',
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Total Recorded Sales Amount: ${(salesProvider.totalSalesAmount * 0.15) + salesProvider.totalSalesAmount}',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                //////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////
                const SizedBox(
                  height: 15,
                ),
                //////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        salesProvider.startFetchingIndicator();
                        Future.delayed(const Duration(seconds: 3), () {
                          salesProvider
                              .getUserSales(authProvider.currentUserModel!.userName, context)
                              .whenComplete(() {
                            salesProvider.startFetchingIndicator();
                            Navigator.pushReplacement(
                                context,
                                RoutingTransitionServices.Transition(const SalesAgentScreen(
                                  initialViewIndex: 0,
                                )));
                          });
                        });
                      },
                      child: salesProvider.isFetchingIndicator
                          ? const SpinKitCircle(
                              size: 20,
                              color: Colors.white,
                            )
                          : Row(
                              children: [
                                const Icon(Icons.refresh_rounded),
                                Text(
                                  'Refresh',
                                  style: Theme.of(context).textTheme.labelMedium,
                                )
                              ],
                            ),
                    ),
                  ],
                ),

                //////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////
                const SizedBox(
                  height: 15,
                ),
                //////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////
                salesProvider.userSalesList.isEmpty
                    ? Center(
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.announcement_outlined,
                                size: 50,
                              ),
                              Text(
                                'You have no recorded invoices yet',
                                style: Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                                  height: 7,
                                ),
                            itemCount: salesProvider.userSalesList.length,
                            itemBuilder: (context, index) {
                              final sale = salesProvider.userSalesList[index];
                              return SalesItemTileWidget(
                                saleItem: sale,
                                index: index,
                              );
                            }),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}
