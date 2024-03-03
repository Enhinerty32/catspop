

 
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//40 maximo
class MountainGraficWidget extends StatelessWidget {
  
    MountainGraficWidget({required this.isShowingMainData,required, this.margenAltura, required this.perfil1, required this.perfil2, this.lineWidth, this.ticketPercentage,   
   });
 int MaxValueList(List<int> lista1, List<int> lista2) {
  int sumaLista1 = lista1.fold(0, (a, b) => a + b);
  int sumaLista2 = lista2.fold(0, (a, b) => a + b);
  return sumaLista1 > sumaLista2 ? sumaLista1 : sumaLista2;
}
  final bool isShowingMainData;
  //Estas son las listas que quieros que sean reflejados en los graficos 
  final List<int> perfil1 ;
  final List<int> perfil2 ;
 final double?lineWidth;
 final double  ?ticketPercentage;
final int ? margenAltura;
  @override
  Widget build(BuildContext context) {
      return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
    
        lineTouchData: lineTouchData1,
        
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX:perfil1.length.toDouble(),
        maxY:(MaxValueList(perfil1,perfil2) * (margenAltura ?? 1)).toDouble(),
        minY: 0,
      );

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
       
        minX: 0,
        maxX: perfil2.length.toDouble(),
        maxY: MaxValueList(perfil1,perfil2).toDouble(),
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.1),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles( 
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2, 
      ];

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles( 
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles( 
          sideTitles: leftTitles(),
        ),
      );


Widget leftTitleWidgets(double value, TitleMeta meta) {
 
  String text = (value).floor().toString();
    return Text('$text', style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 17,
  ), textAlign: TextAlign.center);
        
 
}


  SideTitles leftTitles() => SideTitles(
    
        getTitlesWidget: leftTitleWidgets,
        
        showTitles: true,
        interval: MaxValueList(perfil1,perfil2).toDouble()*(ticketPercentage??0.5),
        reservedSize: 40,
      );
 

  FlGridData get gridData => const FlGridData(show: true, 
  drawHorizontalLine: true
  ,drawVerticalLine: false
  ,);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom:
              BorderSide(color: Colors.purple.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );
      
 

List<FlSpot> createLineList(List<int> list) {
  List<FlSpot> newList = [];
  int previousValue = 0;

  for (var i = 0; i < list.length; i++) {
  int currentValue = list[i];
    int newValue = previousValue + currentValue;
    newList.add(FlSpot((i + 1).toDouble(), newValue.toDouble()));
    previousValue = newValue;
  }

  return newList;
}

// Aqui manipula la grafica del perfil 1
  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors. blue,
        barWidth: lineWidth??2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: true,color: Colors.blue.withOpacity(0.3)),
        spots: createLineList(perfil1),
      );


// Aqui manipula la grafica del perfil 2
  LineChartBarData get lineChartBarData1_2 => LineChartBarData(

        isCurved: true,
        color: Colors.red,
        barWidth: lineWidth??2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.pink.withOpacity(0.3),
        ),
        spots:createLineList(perfil2),
      );





 

 
}




  // Widget bottomTitleWidgets(double value, TitleMeta meta) {
  //   const style = TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 16,
  //   );
  //   Widget text;
  //   switch (value.toInt()) {
  //     case 2:
  //       text = const Text('1', style: style);
  //       break;
  //     case 7:
  //       text = const Text('2', style: style);
  //       break;
  //     case 12:
  //       text = const Text('3', style: style);
  //       break;
  //          case 14:
  //       text = const Text('4', style: style);
  //     default:
  //       text = const Text('');
  //       break;
  //   }

  //   return SideTitleWidget(
  //     axisSide: meta.axisSide,
  //     space: 10,
  //     child: text,
  //   );
  // }

  // SideTitles get bottomTitles => SideTitles(
  //       showTitles: true,
  //       reservedSize: 32,
  //       interval: 1,
  //       getTitlesWidget: bottomTitleWidgets,
  //     );

//va con este 

//   FlTitlesData get titlesData1 => FlTitlesData(
//         bottomTitles: AxisTitles(
//       -->  sideTitles: bottomTitles,
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: leftTitles(),
//         ),
//       );
