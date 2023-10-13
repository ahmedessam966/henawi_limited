import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Controllers/sales_manager_controller.dart';
import 'package:henawi_limited/Services/API/authentication_services.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';

import '../../Managers/Widgets/vertical_nav_bar_widget.dart';

class NewInvoiceWidget extends StatelessWidget {
  final SalesManagerController salesProvider;
  final AuthenticationServices authProvider;
  const NewInvoiceWidget({super.key, required this.salesProvider, required this.authProvider});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalNavBarWidget(),
        Expanded(
            child: Column(
          children: [
            Container(
              width: context.screenWidth * 0.4,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300, borderRadius: BorderRadius.circular(context.screenRatio * 8)),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Search Client...',
                    hintStyle: TextStyle(fontSize: context.screenRatio * 9),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              child: Expanded(
                  flex: 2,
                  child: Card(
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.square_list_fill,
                        ),
                        SizedBox(
                          width: context.screenWidth * 0.01,
                        ),
                        Text(
                          'Viewing Recorded Invoices',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Jump to pending',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ))
      ],
    ));
  }
}
