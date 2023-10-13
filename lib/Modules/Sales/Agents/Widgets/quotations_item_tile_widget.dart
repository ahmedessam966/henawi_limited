import 'package:flutter/material.dart';

import '../../Shared/Models/user_quotations_model.dart';
import 'quotation_details_popup_widget.dart';

class QuotationsItemTileWidget extends StatelessWidget {
  final UserQuotationsModel quotationItem;
  final int index;
  const QuotationsItemTileWidget({super.key, required this.index, required this.quotationItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.comfortable,
      onTap: () {
        showAdaptiveDialog(
            context: context,
            builder: (context) {
              return QuotationDetailsPopupWidget(
                quotationNumber: quotationItem.quotationNumber,
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
            'Quotation Number: ',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            quotationItem.quotationNumber,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Quotation Date/Time: ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(quotationItem.quotationDate),
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
            quotationItem.quotationTotal.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
