import 'package:flutter/cupertino.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Controllers/sales_manager_controller.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:provider/provider.dart';

import '../../Shared/Widgets/nav_bar_active_list_tile.dart';
import '../../Shared/Widgets/nav_bar_inactive_list_tile.dart';

class VerticalNavBarWidget extends StatelessWidget {
  const VerticalNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final salesProvider = Provider.of<SalesManagerController>(context, listen: true);
    return SizedBox(
      width: context.screenWidth / 5,
      height: context.screenHeight,
      child: Padding(
        padding: EdgeInsets.all(context.screenRatio * 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            salesProvider.viewIndex == 0
                ? const NavBarActiveListTile(tileTitle: 'Dashboard | Home', tileIcon: CupertinoIcons.home)
                : NavBarInactiveListTile(
                    tileTitle: 'Dashboard | Home',
                    tileIcon: CupertinoIcons.home,
                    onTap: () {
                      salesProvider.changeViewIndex(0);
                    }),

            //////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            salesProvider.viewIndex == 1
                ? const NavBarActiveListTile(
                    tileTitle: 'Sales Report',
                    tileIcon: CupertinoIcons.graph_square_fill,
                  )
                : NavBarInactiveListTile(
                    tileTitle: 'Sales Report',
                    tileIcon: CupertinoIcons.graph_square_fill,
                    onTap: () {
                      salesProvider.changeViewIndex(1);
                    }),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            salesProvider.viewIndex == 2
                ? const NavBarActiveListTile(
                    tileTitle: 'Invoices',
                    tileIcon: CupertinoIcons.square_list_fill,
                  )
                : NavBarInactiveListTile(
                    tileTitle: 'Invoices',
                    tileIcon: CupertinoIcons.square_list_fill,
                    onTap: () {
                      salesProvider.changeViewIndex(2);
                    },
                  ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            salesProvider.viewIndex == 3
                ? const NavBarActiveListTile(
                    tileTitle: 'Staff Performance',
                    tileIcon: CupertinoIcons.chart_bar_alt_fill,
                  )
                : NavBarInactiveListTile(
                    tileTitle: 'Staff Performance',
                    tileIcon: CupertinoIcons.chart_bar_alt_fill,
                    onTap: () {
                      salesProvider.changeViewIndex(3);
                    },
                  ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            salesProvider.viewIndex == 4
                ? const NavBarActiveListTile(
                    tileTitle: 'Purchase Orders',
                    tileIcon: CupertinoIcons.square_arrow_down_on_square_fill,
                  )
                : NavBarInactiveListTile(
                    tileTitle: 'Purchase Orders',
                    tileIcon: CupertinoIcons.square_arrow_down_on_square_fill,
                    onTap: () {
                      salesProvider.changeViewIndex(4);
                    },
                  ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            salesProvider.viewIndex == 5
                ? const NavBarActiveListTile(
                    tileTitle: 'Quotations',
                    tileIcon: CupertinoIcons.square_arrow_up_on_square_fill,
                  )
                : NavBarInactiveListTile(
                    tileTitle: 'Quotations',
                    tileIcon: CupertinoIcons.square_arrow_up_on_square_fill,
                    onTap: () {
                      salesProvider.changeViewIndex(5);
                    },
                  ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            salesProvider.viewIndex == 6
                ? const NavBarActiveListTile(
                    tileTitle: 'My Profile',
                    tileIcon: CupertinoIcons.profile_circled,
                  )
                : NavBarInactiveListTile(
                    tileTitle: 'My Profile',
                    tileIcon: CupertinoIcons.profile_circled,
                    onTap: () {
                      salesProvider.changeViewIndex(6);
                    },
                  ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            salesProvider.viewIndex == 7
                ? const NavBarActiveListTile(
                    tileTitle: 'Settings',
                    tileIcon: CupertinoIcons.settings_solid,
                  )
                : NavBarInactiveListTile(
                    tileTitle: 'Settings',
                    tileIcon: CupertinoIcons.settings_solid,
                    onTap: () {
                      salesProvider.changeViewIndex(7);
                    },
                  ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            const SizedBox(
              height: 20,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////
            NavBarInactiveListTile(
              tileTitle: 'Log Out',
              tileIcon: CupertinoIcons.lessthan_square_fill,
              onTap: () {
                salesProvider.changeViewIndex(7);
              },
            ),
          ],
        ),
      ),
    );
  }
}
