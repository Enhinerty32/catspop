
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RadarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), 
         
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: RadarChart( 
            RadarChartData(
              
              dataSets: [
                RadarDataSet(  
                  fillColor: Colors.blue.withOpacity(0.5),
                  borderColor: Colors.blue,
                  dataEntries: [
                    RadarEntry(value: 0.8),
                    RadarEntry(value: 0.6),
                    RadarEntry(value: 0.7),
                    RadarEntry(value: 0.9),
                    RadarEntry(value: 0.5),
                    RadarEntry(value: 0.4),
                    RadarEntry(value: 0.6),
                    RadarEntry(value: 0.7),
                  ],
                ),
              ], 
              radarBackgroundColor: Colors.transparent, 
              borderData: FlBorderData(show: false ), 
              radarShape: RadarShape.polygon,
              ticksTextStyle: TextStyle(color: Colors.transparent),
              gridBorderData: BorderSide(color: Colors.transparent,),
              radarBorderData:BorderSide(color: Colors.grey.withOpacity(0.5),),
              tickBorderData: BorderSide(color: Colors.grey.withOpacity(0.5)), 
              getTitle: (index, angle) {
           final listPeronality=  [
          'Extroversion',
          'Introversion',
          'Sensacion',
          'Intuicion',
          'Pensamiento',
          'Sentimiento',
          'Juicio',
          'Percepcion'
        
        ]; 
                  final usedAngle =0.0;
                  switch (index) {
                    case 0:
                      return RadarChartTitle(
                        text: 'E',
                        angle: usedAngle,

                      );
                    case 1:
                      return RadarChartTitle(
                        text: 'I',
                        angle: usedAngle,
                      );
                    case 2:
                      return RadarChartTitle(
                        text: 'S', 
                        angle: usedAngle);
                    case 3:
                      return RadarChartTitle(
                        text: 'N',
                        angle: usedAngle,
                      );
                    case 4:
                      return RadarChartTitle(
                        text: 'T', 
                        angle: usedAngle);    
                    case 5:
                      return RadarChartTitle(
                        text: 'F',
                        angle: usedAngle,
                      );
                    case 6:
                      return RadarChartTitle(
                        text: 'J', 
                        angle: usedAngle);
                                         
                    case 7:
                      return RadarChartTitle(
                        text: 'P',
                        angle: usedAngle,
                      );
                    
                    default:
                      return const RadarChartTitle(text: '');
                  }
} ,
              radarTouchData:  RadarTouchData(
      touchCallback: (FlTouchEvent event, response) {
        if (event is! FlTapUpEvent || response == null) {
          return; // No es un toque válido en el gráfico
        }

        // Verificar si el toque está dentro de un punto específico
        final touchedSpot = response.touchedSpot;
        if (touchedSpot == null || touchedSpot.touchedDataSetIndex < 0) {
          return; // No se tocó ningún punto
        }

        // Obtener información sobre el punto tocado
        final dataSetIndex = touchedSpot.touchedDataSetIndex;
        final spotIndex = touchedSpot.touchedRadarEntryIndex;
        final listPeronality=  [
          'Extroversion',
          'Introversion',
          'Sensacion',
          'Intuicion',
          'Pensamiento',
          'Sentimiento',
          'Juicio',
          'Percepcion'
        
        ];

        // Realizar acciones específicas según el punto tocado
        print('Tocado el punto en el conjunto de datos $dataSetIndex, índice ${listPeronality[spotIndex]}');
        // Aquí puedes realizar cualquier acción que desees en respuesta al toque del usuario
      },
    ),
            ),
          ),
        ),
      ),
    );
  }
}

