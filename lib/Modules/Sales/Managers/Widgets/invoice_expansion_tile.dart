import 'package:flutter/material.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:intl/intl.dart';

import '../../Shared/Models/invoice_model.dart';

class InvoiceExpansionTile extends StatelessWidget {
  final int index;
  final InvoiceModel invoice;
  const InvoiceExpansionTile({super.key, required this.index, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.screenRatio * 8)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.screenRatio * 8)),
      childrenPadding: EdgeInsets.all(context.screenRatio * 8),
      leading: Text('${index + 1}'),
      title: Text(
        'Invoice Number: ${invoice.invoiceNumber}',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text('Issued for ${invoice.client} - An ${invoice.channel} ${invoice.invoiceType} Invoice'),
      trailing: Text('${(invoice.invoiceTotal * 0.15) + invoice.invoiceTotal} SR'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text('Invoice Created By'), Text(invoice.issuedBy)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text('Invoice Date/Time'), Text(invoice.invoiceDate)],
        ),
        invoice.invoiceType == 'Deferred'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Invoice Due Date'),
                  Builder(builder: (context) {
                    DateFormat format = DateFormat('dd MMMM yyyy');
                    DateTime invoiceDate = format.parse(invoice.invoiceDate);
                    int deferDuration = int.parse(invoice.paymentTerms.split(' ')[0]);
                    DateTime dueDate = invoiceDate.add(
                      Duration(days: deferDuration),
                    );
                    DateFormat dateFormat = DateFormat("dd MMMM yyyy");
                    String formattedDate = dateFormat.format(dueDate);
                    return Text(
                      formattedDate,
                      style: DateTime.now().isAfter(dueDate)
                          ? Theme.of(context).textTheme.labelLarge
                          : Theme.of(context).textTheme.labelSmall,
                    );
                  }),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
