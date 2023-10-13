import 'package:flutter/material.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Controllers/sales_manager_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Models/revenue_item_model.dart';

class SalesBarChart extends StatelessWidget {
  const SalesBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("MMMM");
    String formattedDate = dateFormat.format(DateTime.now());
    //
    DateTime firstMonth = DateTime.now().subtract(const Duration(days: 30));
    String firstDate = DateFormat.MMMM().format(firstMonth);
    //
    DateTime secondMonth = DateTime.now().subtract(const Duration(days: 60));
    String secondDate = DateFormat.MMMM().format(secondMonth);
    //
    DateTime thirdMonth = DateTime.now().subtract(const Duration(days: 90));
    String thirdDate = DateFormat.MMMM().format(thirdMonth);
    //
    DateTime fourthMonth = DateTime.now().subtract(const Duration(days: 120));
    String fourthDate = DateFormat.MMMM().format(fourthMonth);
    //
    DateTime fifthMonth = DateTime.now().subtract(const Duration(days: 150));
    String fifthDate = DateFormat.MMMM().format(fifthMonth);
    //
    return Builder(builder: (context) {
      return SfCartesianChart(
        legend: const Legend(
          position: LegendPosition.top,
          orientation: LegendItemOrientation.horizontal,
          isVisible: true,
        ),
        primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Monthly Range')),
        // primaryYAxis: CategoryAxis(),
        series: <ChartSeries>[
          ColumnSeries<OnlineRevenueItemModel, String>(
              name: 'Online Sales',
              dataSource: Provider.of<SalesManagerController>(context, listen: true).onlineRevenueList,
              xValueMapper: (OnlineRevenueItemModel sales, _) => sales.month,
              yValueMapper: (OnlineRevenueItemModel sales, _) => sales.saleValue,
              color: Colors.green,
              width: 0.5),
          ColumnSeries<SalesData, String>(
              name: 'Offline Sales',
              dataSource: [
                SalesData(formattedDate, 55112),
                SalesData(firstDate, 74850),
                SalesData(secondDate, 68560),
                SalesData(thirdDate, 34975.75),
                SalesData(fourthDate, 41320),
                SalesData(fifthDate, 16440.5),
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              color: Colors.red,
              width: 0.5),
        ],
      );
    });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
