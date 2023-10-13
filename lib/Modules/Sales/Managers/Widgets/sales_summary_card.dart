import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../Services/API/authentication_services.dart';
import '../../Shared/Widgets/sales_bar_chart.dart';
import '../Controllers/sales_manager_controller.dart';
import 'rounded_summary_block.dart';
import 'vertical_nav_bar_widget.dart';

class ManagerSalesSummaryCard extends StatelessWidget {
  const ManagerSalesSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SalesManagerController, AuthenticationServices>(
        builder: (context, salesProvider, authProvider, _) {
      salesProvider.getQuarterAnnualRevenue(context);
      // Provider.of<NotificationServices>(context).getUserNotification(authProvider.currentUserModel, context);
      return Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalNavBarWidget(),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: context.screenHeight * 0.4,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(context.screenRatio * 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Daily Digest',
                                            style: GoogleFonts.ubuntu(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontSize: 22),
                                          ),
                                          Builder(builder: (context) {
                                            DateFormat dateFormat = DateFormat("dd MMMM yyyy");
                                            String formattedDate = dateFormat.format(DateTime.now());
                                            return Text(
                                              formattedDate,
                                              style: GoogleFonts.ubuntu(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            );
                                          }),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          salesProvider.startFetchingIndicator();
                                          Future.delayed(const Duration(seconds: 3), () {
                                            salesProvider.getAllThree(context);
                                            salesProvider.getTopAchievers(context);
                                            salesProvider.startFetchingIndicator();
                                          });
                                        },
                                        icon: salesProvider.isFetchingIndicator
                                            ? SpinKitSpinningLines(
                                                color: Colors.blueGrey,
                                                size: context.screenRatio * 15,
                                              )
                                            : const Icon(CupertinoIcons.refresh),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RoundedSummaryBlock(
                                        loader: salesProvider.getTotalGrossPerMonth(context),
                                        onPressed: () async {
                                          salesProvider.getLastInvoiceNumber(context);
                                        },
                                        blockTitle: '${salesProvider.totalGrossSales} SR.',
                                        blockColor: const Color(0xaaf1916d),
                                        circleColor: const Color(0xaaae445a),
                                        blockSub: 'Total Gross',
                                        blockIcon: CupertinoIcons.square_favorites_fill,
                                      ),
                                      RoundedSummaryBlock(
                                        loader: salesProvider.getTotalPO(context),
                                        onPressed: () {},
                                        blockTitle: '${salesProvider.totalAvailablePOs}',
                                        blockColor: const Color(0xaafbcba1).withOpacity(1),
                                        circleColor: const Color(0xaaf59a5e),
                                        blockSub: 'Total Orders',
                                        blockIcon: CupertinoIcons.square_arrow_down_on_square_fill,
                                      ),
                                      RoundedSummaryBlock(
                                        loader: salesProvider.getTotalQuotations(context),
                                        onPressed: () {},
                                        blockTitle: '${salesProvider.totalAvailableQuotations}',
                                        blockColor: const Color(0xaa66efd8),
                                        circleColor: Colors.green,
                                        blockSub: 'Total Quotations',
                                        blockIcon: CupertinoIcons.square_arrow_up_on_square_fill,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: context.screenHeight * 0.4,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(context.screenRatio * 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Top Achievers',
                                        style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w700, color: Colors.black, fontSize: 22),
                                      ),
                                      const Icon(
                                        CupertinoIcons.star_fill,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                  Builder(builder: (context) {
                                    DateFormat dateFormat = DateFormat("MMMM yyyy");
                                    String formattedDate = dateFormat.format(DateTime.now());
                                    return Text(
                                      formattedDate,
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w700, color: Colors.grey, fontSize: 18),
                                    );
                                  }),
                                  SizedBox(
                                    height: context.screenHeight * 0.01,
                                  ),
                                  FutureBuilder(
                                      future: salesProvider.getTopAchievers(context),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return Center(
                                            child: SpinKitSpinningLines(
                                              color: Colors.black,
                                              size: context.screenRatio * 25,
                                            ),
                                          );
                                        } else {
                                          return Expanded(
                                            child: ListView.separated(
                                                shrinkWrap: true,
                                                separatorBuilder: (context, index) => SizedBox(
                                                      height: context.screenHeight * 0.01,
                                                    ),
                                                itemCount: salesProvider.topAchievers.keys.length,
                                                itemBuilder: (context, index) {
                                                  final String name =
                                                      salesProvider.topAchievers.keys.toList()[index];
                                                  final num total = salesProvider.topAchievers[name];
                                                  return Center(
                                                    child: ListTile(
                                                      leading: Text('${index + 1}'),
                                                      title: Text(name),
                                                      trailing: Text('$total'),
                                                    ),
                                                  );
                                                }),
                                          );
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.screenHeight / 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Card(
                          child: SizedBox(
                            height: context.screenHeight * 0.5,
                            child: Padding(
                              padding: EdgeInsets.all(context.screenRatio * 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quarter-Annual Revenue',
                                        style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w700, color: Colors.black, fontSize: 22),
                                      ),
                                      const Icon(
                                        CupertinoIcons.calendar,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  const SalesBarChart(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          child: SizedBox(
                            height: context.screenHeight * 0.5,
                            child: Padding(
                              padding: EdgeInsets.all(context.screenRatio * 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Top Products',
                                        style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w700, color: Colors.black, fontSize: 22),
                                      ),
                                      const Icon(
                                        CupertinoIcons.rectangle_stack_fill_badge_plus,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(context.screenRatio * 8),
                                    ),
                                    leading: const Text('#'),
                                    title: const Text('Product'),
                                    trailing: const Text('Sold'),
                                  ),
                                  Divider(
                                    indent: context.screenWidth * 0.03,
                                  ),
                                  FutureBuilder(
                                      future: salesProvider.getDemandedAndSold(context),
                                      builder: (context, snapshot) {
                                        return Expanded(
                                          child: ListView.separated(
                                            separatorBuilder: (context, index) => SizedBox(
                                              height: context.screenHeight * 0.01,
                                            ),
                                            itemCount: salesProvider.demandedList.keys.length,
                                            itemBuilder: (context, index) {
                                              salesProvider.getDemandedAndSold(context);
                                              final String product =
                                                  salesProvider.demandedList.keys.toList()[index];
                                              final int sold = salesProvider.demandedList[product]['Sold'];
                                              final int requested =
                                                  salesProvider.demandedList[product]['Requested'];
                                              final double ratio = requested / sold;
                                              return ListTile(
                                                onTap: () {},
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(context.screenRatio * 8),
                                                ),
                                                leading: Text('${index + 1}'),
                                                title: Text('$product - Demand: $requested'),
                                                subtitle: LinearProgressIndicator(
                                                  minHeight: context.screenHeight * 0.01,
                                                  borderRadius:
                                                      BorderRadius.circular(context.screenRatio * 8),
                                                  value: ratio,
                                                  semanticsValue: 'Ratio of Sold vs. Requsted',
                                                  backgroundColor: Colors.grey,
                                                  color: ratio >= 1.0 ? Colors.red : Colors.green,
                                                ),
                                                trailing: Text('$sold'),
                                              );
                                            },
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
