import 'package:flutter/material.dart';

import '../../Shared/Models/po_model.dart';
import 'po_details_popup_widget.dart';

class PurchaseOrdersItemWidget extends StatelessWidget {
  final PurchaseOrderModel poItem;
  final int index;
  const PurchaseOrdersItemWidget({super.key, required this.poItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.comfortable,
      onTap: () {
        showAdaptiveDialog(
            context: context,
            builder: (context) {
              return PurchaseOrdersPopupWidget(
                poNumber: poItem.poNumber,
                poModel: poItem,
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
            'Purchase Order Number: ',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            poItem.poNumber,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Requested By: ',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(poItem.poClient),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Purchase Order Date/Time: ',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(poItem.poDate),
            ],
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Status'),
          Text(poItem.poStatus,
              style: poItem.poStatus == 'Processed'
                  ? const TextStyle(
                      fontFamily: 'ubuntu', color: Colors.green, fontSize: 16, fontWeight: FontWeight.w600)
                  : Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
