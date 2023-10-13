import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Shared/Models/po_model.dart';

class PurchaseOrdersPopupWidget extends StatelessWidget {
  final String poNumber;
  final PurchaseOrderModel poModel;
  const PurchaseOrdersPopupWidget({super.key, required this.poNumber, required this.poModel});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        child: SingleChildScrollView(
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
                    'Purchase Order $poNumber',
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
                    Text(poModel.poClient),
                    const Spacer(),
                    const Icon(
                      Icons.calendar_month_rounded,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(poModel.poDate),
                  ],
                ),
                //////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////
                const SizedBox(
                  height: 15,
                ),
                const Center(child: Text('Requisition Breakdown')),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                //////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////

                SizedBox(
                  height: 350,
                  width: 800,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const ScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: poModel.request.keys.length,
                    itemBuilder: (context, index) {
                      final List itemNames = poModel.request.keys.toList();
                      final String itemName = itemNames[index];
                      final Map itemDetails = poModel.request[itemName];
                      final String description = itemDetails['Description'];
                      final int quantity = itemDetails['Quantity'];
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
                      );
                    },
                  ),
                ),
                const Spacer(),
                poModel.poStatus != 'Processed'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Icon(Icons.add_comment_rounded),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Create Quotation',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Icon(CupertinoIcons.arrow_down_doc_fill),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Create Invoice',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xaab51a2b)),
                            child: Row(
                              children: [
                                const Icon(CupertinoIcons.xmark_circle),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Reject PO',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
