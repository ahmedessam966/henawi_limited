import 'package:flutter/material.dart';

import '../../Shared/Models/user_sales_model.dart';
import 'sales_details_popup_widget.dart';

class SalesItemTileWidget extends StatelessWidget {
  final UserSalesModel saleItem;
  final int index;
  const SalesItemTileWidget({super.key, required this.saleItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.comfortable,
      onTap: () {
        showAdaptiveDialog(
            context: context,
            builder: (context) {
              return SalesDetailsPopupWidget(
                invoiceNumber: saleItem.invoiceNumber,
              );
            });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      leading: Text(
        '${index + 1}',
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Invoice Number: ',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            saleItem.invoiceNumber,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Invoice Date/Time: ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(saleItem.invoiceDate),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Total',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            saleItem.invoiceTotal.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
