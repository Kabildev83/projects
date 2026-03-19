import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'chartController.dart';

class Charts extends GetView<ChartsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Obx(() {
          switch (controller.selectedIndex.value) {
            case 0:
            //  controller.updateTooltipBehavior(true);
              return _buildLineChart();
            case 1:
              return _buildBarChart();
            case 2:
              return _buildPieChart();
            case 3:
            //  controller.updateTooltipBehavior(true);
              return _buildBubbleChart();
            case 4:
            //  controller.updateTooltipBehavior(true);
              return _buildLineBarChart();
            default:
            //  controller.updateTooltipBehavior(true);
              return _buildLineChart();
          }
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.line_axis_sharp),
              label: 'LineChart',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'BarChart',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'PieChart',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart),
              label: 'BubbleChart',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.tab_unselected_outlined),
              label: 'SparkLineChart',
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}

  Widget _buildLineChart() {
    return Container(
      width: 300,
      height: 300,
      child: SfCartesianChart(
        title: ChartTitle(text: 'Line Chart'),
       // tooltipBehavior: controller.tooltipBehavior.value,
        series: <ChartSeries>[
          LineSeries<DoubleSalesData, double>(
            dataSource: <DoubleSalesData>[
              DoubleSalesData(0, 10, 5),
              DoubleSalesData(1, 20, 8),
              DoubleSalesData(2, 30, 12),
            ],
            xValueMapper: (DoubleSalesData sales, _) => sales.year,
            yValueMapper: (DoubleSalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
Widget _buildBarChart() {
  return Container(
    width: 300,
    height: 400,
    child: SfCartesianChart(
      title: ChartTitle(text: 'Bar Chart'),
      series: <ChartSeries>[
        BarSeries<DoubleSalesData, double>(
          dataSource: <DoubleSalesData>[
            DoubleSalesData(0, 10),
            DoubleSalesData(1, 20),
            DoubleSalesData(2, 30),
            // Add your data points here
          ],
          xValueMapper: (DoubleSalesData sales, _) => sales.year,
          yValueMapper: (DoubleSalesData sales, _) => sales.sales,
        ),
      ],
    ),
  );
}

Widget _buildLineBarChart() {
  return Container(
    width: 300,
    height: 400,
    child: SfSparkLineChart(
      trackball: SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
      marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
      labelDisplayMode: SparkChartLabelDisplayMode.all,
      data: <double>[1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3],
    ),
  );
}

Widget _buildBubbleChart() {
  return Container(
    width: 300,
    height: 400,
    child: SfCartesianChart(
      title: ChartTitle(text: 'Bubble Chart'),
      series: <ChartSeries>[
        BubbleSeries<DoubleSalesData, double>(
          dataSource: <DoubleSalesData>[
            DoubleSalesData(0, 10, 5),
            DoubleSalesData(1, 20, 8),
            DoubleSalesData(2, 30, 12),
            // Add your data points here
          ],
          xValueMapper: (DoubleSalesData sales, _) => sales.year,
          yValueMapper: (DoubleSalesData sales, _) => sales.sales,
          sizeValueMapper: (DoubleSalesData sales, _) => sales.quantity,
        ),
      ],
    ),
  );
}

Widget _buildPieChart() {
  return Container(
    width: 300,
    height: 400,
    child: SfCircularChart(
      title: ChartTitle(text: 'Pie Chart'),
      //tooltipBehavior: controller.tooltipBehavior,
      series: <PieSeries<StringSalesData, String>>[
        PieSeries<StringSalesData, String>(
          dataSource: <StringSalesData>[
            StringSalesData('A', 10),
            StringSalesData('B', 20),
            StringSalesData('C', 30),
            // Add your data points here
          ],
          xValueMapper: (StringSalesData sales, _) => sales.year,
          yValueMapper: (StringSalesData sales, _) => sales.sales,
          dataLabelMapper: (StringSalesData sales, _) => sales.year,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

  class DoubleSalesData {
  final double year;
  final double sales;
  final double? quantity;

  DoubleSalesData(this.year, this.sales, [this.quantity]);
  }

class StringSalesData {
  final String year;
  final double sales;

  StringSalesData(this.year, this.sales);
}
