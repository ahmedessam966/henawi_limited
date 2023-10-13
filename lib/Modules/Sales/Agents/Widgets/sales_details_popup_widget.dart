import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:henawi_limited/Modules/Sales/Agents/Controllers/sales_agent_controller.dart';
import 'package:provider/provider.dart';

class SalesDetailsPopupWidget extends StatelessWidget {
  final String invoiceNumber;
  const SalesDetailsPopupWidget({
    super.key,
    required this.invoiceNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        child: FutureBuilder(
            future: Provider.of<SalesAgentController>(context, listen: false)
                .fetchSingleInvoiceDetails(invoiceNumber, context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    height: 800,
                    width: 800,
                    child: SpinKitSpinningLines(
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: SvgPicture.asset(
                      'assets/icons/not-found.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 600,
                    width: 750,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Text(
                            'Preview Invoice $invoiceNumber',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        //////////////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////////////
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                        //////////////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////////////
                        Row(
                          children: [
                            const Icon(
                              Icons.business_center_rounded,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('${snapshot.data?.client}'),
                            const Spacer(),
                            const Icon(
                              Icons.calendar_month_rounded,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('${snapshot.data?.invoiceDate}'),
                          ],
                        ),
                        //////////////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////////////
                        const SizedBox(
                          height: 15,
                        ),
                        const Center(child: Text('Invoice Breakdown')),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //////////////////////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////////////////////

                        Center(
                            child: Text(
                          'Unit prices in invoice breakdown below are VAT EXCLUSIVE',
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                        SizedBox(
                          height: 350,
                          width: 800,
                          child: ListView.separated(
                            physics: const ScrollPhysics(),
                            separatorBuilder: (context, index) => const Divider(),
                            itemCount: snapshot.data!.items.keys.length,
                            itemBuilder: (context, index) {
                              final List itemNames = snapshot.data!.items.keys.toList();
                              final String itemName = itemNames[index];
                              final Map itemDetails = snapshot.data!.items[itemName];
                              final String description = itemDetails['Description'];
                              final int quantity = itemDetails['Quantity'];
                              final num unitPrice = itemDetails['Unit Price'];

                              return ListTile(
                                visualDensity: VisualDensity.comfortable,
                                title: Text(
                                  itemName,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                subtitle: Text(description),
                                leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'QTY',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(
                                      '$quantity',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Price',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(
                                      '$unitPrice',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('VAT Exclusive Total: ${snapshot.data?.invoiceTotal} SR'),
                                Text(
                                    'VAT Inclusive Total: ${(snapshot.data!.invoiceTotal * 0.15) + snapshot.data!.invoiceTotal} SR'),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    const Icon(Icons.send_rounded),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Email Invoice',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
