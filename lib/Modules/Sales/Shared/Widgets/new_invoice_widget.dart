import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Controllers/sales_manager_controller.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Widgets/vertical_nav_bar_widget.dart';
import 'package:henawi_limited/Modules/Sales/Shared/Models/invoice_model.dart';
import 'package:henawi_limited/Modules/Sales/Shared/Widgets/recent_invoice_flushbar.dart';
import 'package:henawi_limited/Services/API/authentication_services.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class NewInvoiceWidget extends StatelessWidget {
  const NewInvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SalesManagerController, AuthenticationServices>(
        builder: (context, salesProvider, authProvider, _) {
      salesProvider.getClients(context);
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalNavBarWidget(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(context.screenRatio * 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        String newInvoiceNumber = salesProvider.lastInvoiceNumber;
                        List<String> parts = newInvoiceNumber.split("-");
                        int xx = int.parse(parts[0]);
                        xx += 1;
                        String output = "$xx-${parts[1]}-${parts[2]}";
                        return Text('Invoice: $output');
                      }),
                      Container(
                        width: context.screenWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(context.screenRatio * 8)),
                        child: TypeAheadFormField(
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                              borderRadius: BorderRadius.circular(context.screenRatio * 8)),
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                                hintText: salesProvider.searchController.text.isEmpty
                                    ? 'Search for a client...'
                                    : salesProvider.searchController.text,
                                hintStyle: TextStyle(fontSize: context.screenRatio * 9),
                                prefixIcon: const Icon(
                                  CupertinoIcons.briefcase_fill,
                                ),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none),
                          ),
                          suggestionsCallback: (pattern) {
                            final List clients = [];
                            for (var element in salesProvider.clientsList) {
                              clients.add(element.clientName);
                            }
                            if (pattern.isEmpty) {
                              return clients;
                            } else {
                              var filteredList = clients
                                  .where((item) => item.toLowerCase().startsWith(pattern.toLowerCase()))
                                  .toList();
                              return filteredList;
                            }
                          },
                          onSuggestionSelected: (suggestion) async {
                            salesProvider.changeSearchValue(suggestion);
                            InvoiceModel? mostRecentInvoice;
                            await salesProvider.fetchSingleInvoiceDetails(suggestion, context).then((value) {
                              if (value != null) {
                                mostRecentInvoice = InvoiceModel(
                                    client: value.client,
                                    issuedBy: value.issuedBy,
                                    invoiceDate: value.invoiceDate,
                                    invoiceTotal: value.invoiceTotal,
                                    items: value.items,
                                    invoiceType: value.invoiceType,
                                    paymentTerms: value.paymentTerms,
                                    invoiceNumber: value.invoiceNumber,
                                    channel: value.channel);
                              }
                            });
                            // ignore: use_build_context_synchronously
                            RecentInvoiceFlushbar.showRecentInvoiceFlushbar(context, mostRecentInvoice);
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                salesProvider.searchController.text.isNotEmpty
                    ? const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ],
      );
    });
  }
}
