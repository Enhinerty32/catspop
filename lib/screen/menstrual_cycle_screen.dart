import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenstrualCycleScreen extends StatelessWidget {
  MenstrualCycleScreen({super.key});

  // Ejemplo de uso:
  // Fecha de la última menstruación.
  final lastPeriodDate = DateTime.now();

  // DateTime.parse("2023-11-14")

  // Duración del ciclo menstrual en días.
  final cycleLength = 28;

  // Año para el que se desea calcular la menstruación.
  final year = 2024;

  @override
  Widget build(BuildContext context) {
    final fechaInicioSangrado = DateTime.parse('2024-03-01');

    final listaCiclos = calcularCiclosMenstruales(
        fInitB: fechaInicioSangrado,
       );
 
   
    return Container();
  }



/// Esta función calcula las fechas de inicio y fin del sangrado, la ventana fértil y el ciclo menstrual completo para un número determinado de ciclos.
///
/// Parámetros:
///  * `fInitB` (obligatorio)                  : Fecha de inicio del primer ciclo menstrual (formato `DateTime`).
///  * `D_AverageC` (opcional, por defecto 28) : Duración promedio del ciclo menstrual completo (días).
///  * `D_AverageB` (opcional, por defecto 5)  : Duración promedio del sangrado menstrual (días).
///  * `DaysFertile` (opcional, por defecto 17): Duración de la ventana fértil (días).
///  * `NumM` (opcional, por defecto 12): Número de ciclos menstruales a calcular.
///
/// Devuelve:
///   Una lista de mapas, donde cada mapa representa un ciclo menstrual. Cada mapa contiene las siguientes claves:
///  * `initB`: Fecha de inicio del sangrado.
///  * `endB` : Fecha de fin del sangrado.
///  * `initF`: Fecha de inicio de la ventana fértil.
///  * `endMC`: Fecha de fin del ciclo menstrual.
  List<Map<String, dynamic>> calcularCiclosMenstruales(
      {required DateTime fInitB,
      int? D_AverageC,
      int? D_AverageB,
      int? DaysFertile,
      int? NumM}) {
        
    int? dAverageC = D_AverageC ?? 28;
    int? dAverageB = D_AverageB ?? 5;
    int? daysFertile = DaysFertile ?? 17;
    final int numM = NumM ?? 12;
    List<String> listaCiclos = [];
    List<Map<String, dynamic>> mapsDateMain = [];

    for (int i = 0; i < numM; i++) {
      DateTime fechaInicioCicloActual = fInitB;
      DateTime fechaFinSangrado =
          fechaInicioCicloActual.add(Duration(days: dAverageB - 1));
      int duracionFaseFolicular = dAverageC - dAverageB;
      DateTime fechaInicioFertilidad = fechaFinSangrado
          .add(Duration(days: duracionFaseFolicular - daysFertile));
      DateTime fechaFinFertilidad =
          fechaInicioFertilidad.add(Duration(days: daysFertile - 1));

      
      String initDateBlood =
          DateFormat('dd/MM/yyyy').format(fechaInicioCicloActual);
      String endDateBlood = DateFormat('dd/MM/yyyy').format(fechaFinSangrado);
      String initFertile =
          DateFormat('dd/MM/yyyy').format(fechaInicioFertilidad);
      String endMenstrualCycle =
          DateFormat('dd/MM/yyyy').format(fechaFinFertilidad);

      mapsDateMain.add(
        {
          "initB": initDateBlood,
          "endB": endDateBlood,
          "initF": initFertile,
          "endMC": endMenstrualCycle
        },
      );
 
      fInitB = fechaFinSangrado.add(Duration(days: dAverageC - dAverageB));
    }

    return mapsDateMain;
  }
}
