import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';

import '../Models/invoice_model.dart';

class RecentInvoiceFlushbar {
  static Future<void> showRecentInvoiceFlushbar(BuildContext context, InvoiceModel? mostRecentInvoice) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      titleText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Most Recent Invoice for ${mostRecentInvoice?.client} - ${mostRecentInvoice?.invoiceDate}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.checkmark_alt_circle_fill,
                color: Colors.green,
              ))
        ],
      ),
      leftBarIndicatorColor: Colors.yellow.shade600,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(context.screenRatio * 8),
        bottomLeft: Radius.circular(context.screenRatio * 8),
      ),
      backgroundColor: Colors.white70.withOpacity(1),
      messageText: SizedBox(
        height: context.screenHeight * 0.25,
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  indent: context.screenWidth * 0.01,
                ),
            itemCount: mostRecentInvoice!.items.keys.length,
            itemBuilder: (context, index) {
              final List itemNames = mostRecentInvoice.items.keys.toList();
              final String itemName = itemNames[index];
              final Map itemDetails = mostRecentInvoice.items[itemName];
              final String description = itemDetails['Description'];
              final num unitPrice = itemDetails['Unit Price'];
              return ListTile(
                title: Text(itemName),
                subtitle: Text(description),
                trailing: Text('${(unitPrice * 0.15) + unitPrice} SR./Unit'),
              );
            }),
      ),
    ).show(context);
  }
}
