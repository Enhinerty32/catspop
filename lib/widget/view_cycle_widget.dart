import 'dart:ffi';
 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


class ViewCycleWidget extends StatelessWidget {
  ViewCycleWidget({super.key,required this.now,required this.dateReferenceStartBleed});

  @override
  // Principal
  final now ; 
  //DateTime.now();
  // test=DateTime.parse('2024-05-22')
  final dateReferenceStartBleed ;
  // DateTime.parse('2024-03-01');

  Widget build(BuildContext context) {
    final date = resultDate(dateReferenceStartBleed, now);
   // print("este es el que hize $date");

    // Variables Centrales
    final String initDateBlood = date["initB"]!;
    final String endDateBlood = date["endB"]!;
    final String initFertile = date["initF"]!;
    final String endMenstrualCycle = date["endMC"]!;

    String voidTextComplete() {
      String first = "Inicio Menstruación: $initDateBlood (Comienzo del sangrado)";
      String second = "Fin Menstruación: $endDateBlood (Fin del sangrado)";
      String third = "Inicio Fertilidad: $initFertile (Inicio del período fértil)";
      String fourth = "Fin del Ciclo Menstrual: $endMenstrualCycle (Final del ciclo menstrual)";

      return "$first \n\n$second \n\n$third \n\n$fourth";
    }

    final totalWidth = 360;
    final dateFormat = DateFormat('dd/MM/yyyy');
    final initialDate = dateFormat.parse(initDateBlood);
    final endDate = dateFormat.parse(endMenstrualCycle);
    final differenceInDays = endDate.difference(initialDate).inDays;

    final dateNow = dateFormat.format(now);

    final daysSinceStart = now.difference(initialDate).inDays;
    final positionNow = (daysSinceStart / differenceInDays) * totalWidth;

    final startBloodPosition =
        (dateFormat.parse(initDateBlood).difference(initialDate).inDays / differenceInDays) * totalWidth;
    final endBloodPosition =
        (dateFormat.parse(endDateBlood).difference(initialDate).inDays / differenceInDays) * totalWidth;
    final startFertilePosition =
        (dateFormat.parse(initFertile).difference(initialDate).inDays / differenceInDays) * totalWidth;
    final endFertilePosition = startFertilePosition + (6 / differenceInDays) * totalWidth; // 6 days of fertility period

    return Tooltip(
      message: voidTextComplete(), 
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 10.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: totalWidth.toDouble(),
            ),
            Positioned(
              left: startBloodPosition,
              width: endBloodPosition - startBloodPosition,
              child: Container(
                height: 10.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                ),
              ),
            ),
            Positioned(
              left: startFertilePosition,
              width: endFertilePosition - startFertilePosition,
              child: Container(
                height: 10.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
            ),
            Positioned(
              left: positionNow,
              child: Container(
                height: 10.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
 
Map<String, String> resultDate(DateTime fechaReferenciaInicioSangrado, DateTime now) {
  final List<Map<String, String>> listCycloMenstrual = calcularCiclosMenstruales(fInitB: fechaReferenciaInicioSangrado);
  final Map<String, String>? resultadoEncontrado = encontrarCicloEnRango(now, listCycloMenstrual);
  if (resultadoEncontrado == null) {
    return {'initB': '01/01/2000', 'endB': '05/01/2000', 'initF': '11/01/0000', 'endMC': '27/01/2000'};
  }
  return resultadoEncontrado;
}




Map<String, String>? encontrarCicloEnRango(DateTime now, List<Map<String, String>> listCycloMenstrual) {
  for (var ciclo in listCycloMenstrual) {
    DateTime initB = DateTime.parse(ciclo['initB']!.split('/').reversed.join('-'));
    DateTime endMC = DateTime.parse(ciclo['endMC']!.split('/').reversed.join('-'));
    if (now.isAfter(initB) && now.isBefore(endMC)) {
      return ciclo;
    }
  }
  return null;
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
List<Map<String, String>> calcularCiclosMenstruales({
  required DateTime fInitB,
  int? D_AverageC,
  int? D_AverageB,
  int? DaysFertile,
  int? NumM,
}) {
  int? dAverageC = D_AverageC ?? 28;
  int? dAverageB = D_AverageB ?? 5;
  int? daysFertile = DaysFertile ?? 17;
  final int numM = NumM ?? 12;
  List<Map<String, String>> mapsDateMain = [];

  for (int i = 0; i < numM; i++) {
    DateTime fechaInicioCicloActual = fInitB;
    DateTime fechaFinSangrado = fechaInicioCicloActual.add(Duration(days: dAverageB - 1));
    int duracionFaseFolicular = dAverageC - dAverageB;
    DateTime fechaInicioFertilidad = fechaFinSangrado.add(Duration(days: duracionFaseFolicular - daysFertile));
    DateTime fechaFinFertilidad = fechaInicioFertilidad.add(Duration(days: daysFertile - 1));

    String initDateBlood = DateFormat('dd/MM/yyyy').format(fechaInicioCicloActual);
    String endDateBlood = DateFormat('dd/MM/yyyy').format(fechaFinSangrado);
    String initFertile = DateFormat('dd/MM/yyyy').format(fechaInicioFertilidad);
    String endMenstrualCycle = DateFormat('dd/MM/yyyy').format(fechaFinFertilidad);

    mapsDateMain.add({
      "initB": initDateBlood,
      "endB": endDateBlood,
      "initF": initFertile,
      "endMC": endMenstrualCycle
    });

    fInitB = fechaFinSangrado.add(Duration(days: dAverageC - dAverageB));
  }

  return mapsDateMain;
}