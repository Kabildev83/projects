import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartsController extends GetxController {
var selectedIndex = 0.obs;
late TooltipBehavior tooltipBehavior;

@override
void onInit() {
  tooltipBehavior = TooltipBehavior(enable: true);
  super.onInit();
}

void onItemTapped(int index) {
  selectedIndex.value = index;
}
}