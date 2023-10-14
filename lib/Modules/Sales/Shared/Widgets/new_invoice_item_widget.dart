import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:henawi_limited/providers.dart';
import 'package:provider/provider.dart';

class NewInvoiceItemWidget extends StatefulWidget {
  const NewInvoiceItemWidget({super.key});
  static int index = 0;

  @override
  State<NewInvoiceItemWidget> createState() => _NewInvoiceItemWidgetState();
}

final TextEditingController _productSerialController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
final TextEditingController _unitPriceController = TextEditingController();
final TextEditingController _quantity = TextEditingController();
final TextEditingController _availableStock = TextEditingController();

bool _readOnlyDescription = true;
bool _readOnlyPrice = true;

class _NewInvoiceItemWidgetState extends State<NewInvoiceItemWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.08,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '${NewInvoiceItemWidget.index}',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
              flex: 3,
              child: Builder(builder: (context) {
                final salesProvider = Provider.of<SalesManagerController>(context, listen: false);
                salesProvider.getInventoryProducts(context);
                return TypeAheadField(
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(context.screenRatio * 8),
                      bottomRight: Radius.circular(context.screenRatio * 8),
                    ),
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _productSerialController,
                    decoration: const InputDecoration(
                      hintText: 'Product',
                      focusedBorder: UnderlineInputBorder(),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    if (pattern.isEmpty) {
                      return salesProvider.fetchedProducts;
                    } else {
                      var filteredList = salesProvider.fetchedProducts
                          .toList()
                          .where((item) => item.toLowerCase().startsWith(pattern.toLowerCase()))
                          .toList();
                      return filteredList;
                    }
                  },
                  onSuggestionSelected: (suggestion) async {
                    await salesProvider.fetchSingleProductDetails(context, suggestion).then((value) {
                      setState(() {
                        _productSerialController.text = suggestion;
                        _descriptionController.text = value.description;
                        _unitPriceController.text = value.price.toString();
                        _availableStock.text = value.stock.toString();
                      });
                    });
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                );
              })),
          const VerticalDivider(),
          Expanded(
            flex: 4,
            child: TextField(
              maxLines: null,
              minLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              controller: _descriptionController,
              readOnly: _readOnlyDescription,
              onTap: () {
                if (Provider.of<AuthenticationServices>(context, listen: false).currentUserModel?.position !=
                    null) {
                  if (Provider.of<AuthenticationServices>(context, listen: false)
                          .currentUserModel
                          ?.position
                          .endsWith('Manager') ==
                      true) {
                    setState(() {
                      _readOnlyDescription = false;
                    });
                  }
                }
              },
              onChanged: (value) {
                setState(() {
                  _descriptionController.text = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Description',
                focusedBorder: UnderlineInputBorder(),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 1,
            child: TextFormField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                if (int.parse(value) > int.parse(_availableStock.text)) {
                  Flushbar(
                    title: 'Exceeding Stock',
                    titleColor: Colors.red,
                    message:
                        'The quantity requested exceeds that of the product\'s available stock of $_availableStock units',
                  ).show(context);
                } else if (value.isEmpty || value == null || int.parse(value) == 0) {
                  Flushbar(
                    title: 'Quantity Required',
                    titleColor: Colors.red,
                    message: 'Please enter a valid number between 1 and ${_availableStock.text}',
                  ).show(context);
                } else {
                  setState(() {
                    _quantity.text = value;
                  });
                }
              },
              onFieldSubmitted: (value) {
                if (int.parse(value) > int.parse(_availableStock.text)) {
                  Flushbar(
                    title: 'Exceeding Stock',
                    titleColor: Colors.red,
                    message:
                        'The quantity requested exceeds that of the product\'s available stock of ${_availableStock.text} units',
                  ).show(context);
                } else {
                  setState(() {
                    _quantity.text = value;
                  });
                }
              },
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 1,
            child: TextField(
              textAlign: TextAlign.center,
              readOnly: _readOnlyPrice,
              controller: _unitPriceController,
              decoration: const InputDecoration(
                hintText: 'Unit Price',
                focusedBorder: UnderlineInputBorder(),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
