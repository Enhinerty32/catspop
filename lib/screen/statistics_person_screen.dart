 import 'package:catspop/widget/mountainGrafic_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsPersonScreen extends StatelessWidget {
     StatisticsPersonScreen({super.key});
     final List<int> perfil1=[0, 0, 0, 5, 1, 3, 1, 5, 0, 3, 3, 3, 0, 0, 0, 1, 3, 3, 5, 1, 3, 3, 3, 0, 0, 0, 0, 3, 1, 5, 0, 3, 3, 3, 0, 0, 5, 1, 3, 1, 5, 0, 3, 3, 3]
;
  final List<int> perfil2 =  [5, 5, 5, 0, 1, 3, 1, 0, 5, 3, 3, 3, 5, 5, 5, 1, 3, 3, 0, 1, 3, 3, 3, 5, 5, 5, 5, 3, 1, 0, 5, 0, 3, 3, 5, 5, 1, 5, 3, 5, 1, 5, 3, 3, 3]
;
   @override
   Widget build(BuildContext context) {
     return Scaffold(body: Column(
      children: [
       
         Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.clear)),
            ),
        SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: 
              GraficMountain() , 
        ),CircleGrafics(),
         LineGraf(cyanPoints: 50, otherPoints: 200) ,ButtonsAR()
      ],
    ),);

   }
     Widget GraficMountain() {
    return SingleChildScrollView(scrollDirection: Axis.horizontal,
    child: Container(
     padding: EdgeInsets.only(top: 20,bottom: 10,right: 20),
    height: 200,width:perfil1.length *23, 
        child: MountainGraficWidget(ticketPercentage: 0.5,
        margenAltura: 2,
        isShowingMainData: true,
        perfil1: perfil1,perfil2: perfil2)) ,
     
    );
  }
  
  Widget CircleGrafics() {
    return Container( 
      padding: EdgeInsets.all(6),
      height: 220,
      child:   Row(

        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 220,
          width: 220, 
          child: PieChart(
            PieChartData(
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 5,
                sectionsSpace: 2,
                sections: [
                  PieChartSectionData(
                      title: 'Acuerdos',
                      value: 19,
                      radius: 100,
                      color: Colors.green),
                  PieChartSectionData(
                      title: 'Traicion',
                      value: 30,
                      radius: 100,
                      color: Colors.yellow),
                  PieChartSectionData(
                      title: 'Desacuerdo',
                      value: 19,
                      radius: 100,
                      color: Colors.red)
                ]),
          ),
        ),SizedBox(width: 10,),
         Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: [tittlePlusIcon('Acuerdo', Colors.green),
                 tittlePlusIcon('Traicion', Colors.yellow),
                 tittlePlusIcon('Desacuerdo', Colors.red),],)
      ],
    )
    );
  }




  Widget ButtonsAR() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Accion"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightGreenAccent)),
                    onPressed: () {},
                    icon: Icon(Icons.add)),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 255, 100, 100))),
                    onPressed: () {},
                    icon: Icon(Icons.remove))
              ],
            )
          ]),
          SizedBox(
            height: 6,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Reaccion"),
            SizedBox(
              width: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightGreenAccent)),
                    onPressed: () {},
                    icon: Icon(Icons.add)),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 255, 100, 100))),
                    onPressed: () {},
                    icon: Icon(Icons.remove))
              ],
            )
          ])
        ],
      ),
    );
  }

  //Adiconales
    Widget tittlePlusIcon(String tittle, Color color) {
    return Row(
      children: [
        Icon(Icons.circle, color: color),
        SizedBox(width: 10),
        Text(tittle),
      ],
    );
  }
 }
 
 class LineGraf extends StatelessWidget {
  final int cyanPoints, otherPoints;

  const LineGraf({
    Key? key,
    required this.cyanPoints,
    required this.otherPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalPoints = cyanPoints + otherPoints;
    final cyanRatio = cyanPoints / totalPoints;
    final otherRatio = otherPoints / totalPoints;

    return Container( 
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatisticsPersonScreen().tittlePlusIcon('yo', Colors.blue),
              StatisticsPersonScreen().tittlePlusIcon('Ella', Colors.red)
            ],
          ),
          SizedBox(
            width: 20,
          ),
        Column(      mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,children: [   _buildBar(
            color: Colors.cyan,
            width: (220 * cyanRatio).toDouble(),
          ),   SizedBox(
            height: 6,
          ),
          const SizedBox(width: 10),
          _buildBar(
            color: _getOppositeColor(Colors.cyan),
            width: (220 * otherRatio).toDouble(),
          ),],),
          SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildBar(
      {required Color color,   double? height, double? width}) {
    return Container(
      width: width ?? 20,
      height: height ?? 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Color _getOppositeColor(Color color) {
    final hsvColor = HSVColor.fromColor(color);
    final oppositeHue = (hsvColor.hue + 180) % 360;
    return HSVColor.fromAHSV(
            hsvColor.alpha, oppositeHue, hsvColor.saturation, hsvColor.value)
        .toColor();
  }


  
}
 
 