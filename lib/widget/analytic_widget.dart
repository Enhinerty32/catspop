
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnalyticWidget extends StatelessWidget {
    AnalyticWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    
    return Container();
  }

  //Creacion de teoria de juego
  dynamic testGame(List<String> decisionesA, List<String> decisionesB) {
    if (decisionesB.length != decisionesA.length) {
      return 'Error: Listas despropocional';
    }

    List<int> puntosA = [];
    List<int> puntosB = [];

    for (int i = 0; i < decisionesA.length; i++) {
      if (decisionesA[i] == 'Cooperar') {
        if (decisionesB[i] == 'Cooperar') {
          puntosA.add(3);
          puntosB.add(3);
          //"Ambos jugadores cooperaron."
        } else if (decisionesB[i] == 'No Cooperar') {
          puntosA.add(0);
          puntosB.add(5);
          //"El Jugador A cooperó pero el Jugador B no cooperó."
        }
      } else if (decisionesA[i] == 'No Cooperar') {
        if (decisionesB[i] == 'Cooperar') {
          puntosA.add(5);
          puntosB.add(0);
          //"El Jugador B cooperó pero el Jugador A no cooperó."
        } else if (decisionesB[i] == 'No Cooperar') {
          puntosA.add(1);
          puntosB.add(1);
          //"Ninguno de los jugadores cooperó."
        }
      }
    }
    // Retorna una lista
    return [puntosA, puntosB];
  }

  Widget analyticResult(BuildContext context) {
    List<String> decisionesA = [
      'Cooperar',
      'Cooperar',
      'No Cooperar',
      'No Cooperar',
      'Cooperar',
      'Cooperar'
    ];
    List<String> decisionesB = [
      'Cooperar',
      'No Cooperar',
      'Cooperar',
      'No Cooperar',
      'No Cooperar',
      'No Cooperar'
    ];

    List<List<int>> puntos = testGame(decisionesA, decisionesB);
    print(
        "Puntos del Jugador A: ${puntos[0].reduce((valorAnterior, valorActual) => valorAnterior + valorActual)}");
    print(
        "Puntos del Jugador B: ${puntos[1].reduce((valorAnterior, valorActual) => valorAnterior + valorActual)}");

    //Sistema de afirmacion con 5 lenguajes y linea de tiempo de turnos para saber si ella copero o no
    final listLenguas = [
      "Palabras de afirmación",
      "Tiempo de calidad",
      "Regalos",
      "Actos de servicio",
      "Contacto físico",
      "Sentimiento positivo"
    ];

    final int count = 0;
    final List<int> you = [];
    final List<int> i = [];

    return SliverToBoxAdapter(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 26, 255, 45))),
          child: Text('Butto'),
          onPressed: () {
            Navigator.pushNamed(context, "Statistics");
       
          }),
    );
  }
//Crear targetas desplegables
      // showModalBottomSheet(
      //         context: context,
      //         builder: (context) {
      //           return SizedBox( 
      //             child: Center(
      //               child: plusPoints(context),
      //             ),
      //           );
      //         },
      //       );
 
 
  // Widget fourthOne() {
  //   final List<String> specials = [
  //     'Deporte',
  //     'Chistes',
  //     'Anime',
  //     'kpop',
  //     'Parangaricuirimicfsdfasdasdfasdfasdfasd asdfasdfa asdfasdfas asdfasdfa asdf sa dafsdafuaro',
  //     'Chistes',
  //     'Anime',
  //     'kpop',
  //     'Deporte',
  //     'Comer tofu',
  //     'kpop',
  //     'Parangaricuirimicfsdfasdfuaro',
  //     'Chistes',
  //     'Anime',
  //     'Deporte',
  //   ];
  //   return SliverToBoxAdapter(
  //     child: SizedBox(
  //       height: 180,
  //       child: GridView.builder(
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //         ),
  //         scrollDirection: Axis.horizontal,
  //         itemCount: specials.length,
  //         itemBuilder: (context, index) {
  //           return Tooltip(
  //             showDuration: Duration(minutes: 1),
  //             message: '${specials[index]}',
  //             child: Container(
  //                 alignment: Alignment.center,
  //                 padding: EdgeInsets.all(5),
  //                 color: Colors.amberAccent,
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                       color: Colors.red,
  //                       borderRadius: BorderRadius.circular(20)),
  //                   padding: EdgeInsets.all(7),
  //                   child: Text(
  //                     '${specials[index]}',
  //                     maxLines: 2,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 )),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}

 