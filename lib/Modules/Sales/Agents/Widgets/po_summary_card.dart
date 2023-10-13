import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:henawi_limited/Modules/Sales/Agents/Controllers/sales_agent_controller.dart';
import 'package:henawi_limited/Modules/Sales/Agents/Screens/sales_agent_screen.dart';
import 'package:provider/provider.dart';

import '../../../../Services/Local/routing_transition_services.dart';
import 'po_item_tile_widget.dart';

class POSummaryCard extends StatelessWidget {
  const POSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SalesAgentController>(builder: (context, salesProvider, _) {
      salesProvider.getPurchaseOrders(context);
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
                      Icons.rule_folder_rounded,
                      color: const Color(0xaa072e33).withOpacity(1),
                      size: 35,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Available Purchase Orders', style: Theme.of(context).textTheme.titleLarge),
                    const Spacer(),
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
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        salesProvider.startFetchingIndicator();
                        Future.delayed(const Duration(seconds: 3), () {
                          salesProvider.startFetchingIndicator();
                          Navigator.pushReplacement(
                            context,
                            RoutingTransitionServices.Transition(
                              const SalesAgentScreen(
                                initialViewIndex: 4,
                              ),
                            ),
                          );
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

                salesProvider.poList.isEmpty
                    ? const Center(
                        child: Text('An error ocurred'),
                      )
                    : FutureBuilder(
                        future: salesProvider.getPurchaseOrders(context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: SpinKitCircle(
                                color: Colors.black,
                                size: 35,
                              ),
                            );
                          } else {
                            return Expanded(
                              child: ListView.separated(
                                  separatorBuilder: (context, index) => const SizedBox(
                                        height: 7,
                                      ),
                                  itemCount: salesProvider.poList.length,
                                  itemBuilder: (context, index) {
                                    final po = salesProvider.poList[index];
                                    return PurchaseOrdersItemWidget(
                                      poItem: po,
                                      index: index,
                                    );
                                  }),
                            );
                          }
                        })
              ],
            ),
          ),
        ),
      );
    });
  }
}
