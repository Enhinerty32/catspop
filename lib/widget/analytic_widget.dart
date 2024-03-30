
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AnalyticWidget extends StatelessWidget {
  const AnalyticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  List<List<int>> testGame(List<String> decisionsA, List<String> decisionsB) {
    if (decisionsB.length != decisionsA.length) {
      throw 'Error: Listas desproporcionadas';
    }

    List<int> pointsA = [];
    List<int> pointsB = [];

    for (int i = 0; i < decisionsA.length; i++) {
      if (decisionsA[i] == 'Cooperar') {
        if (decisionsB[i] == 'Cooperar') {
          pointsA.add(3);
          pointsB.add(3);
        } else if (decisionsB[i] == 'No Cooperar') {
          pointsA.add(0);
          pointsB.add(5);
        }
      } else if (decisionsA[i] == 'No Cooperar') {
        if (decisionsB[i] == 'Cooperar') {
          pointsA.add(5);
          pointsB.add(0);
        } else if (decisionsB[i] == 'No Cooperar') {
          pointsA.add(1);
          pointsB.add(1);
        }
      }
    }
    return [pointsA, pointsB];
  }

  Widget analyticResult(BuildContext context) {
    final List<String> decisionsA = [
      'Cooperar',
      'Cooperar',
      'No Cooperar',
      'No Cooperar',
      'Cooperar',
      'Cooperar'
    ];
    final List<String> decisionsB = [
      'Cooperar',
      'No Cooperar',
      'Cooperar',
      'No Cooperar',
      'No Cooperar',
      'No Cooperar'
    ];

    final List<List<int>> points = testGame(decisionsA, decisionsB);
    final int totalPointsA = points[0].reduce((a, b) => a + b);
    final int totalPointsB = points[1].reduce((a, b) => a + b);

    final List<String> loveLanguages = [
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
  //Botton push page
    return SliverToBoxAdapter(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromARGB(255, 26, 255, 45),
          ),
        ),
        child: Text('Butto'),
        onPressed: () {
          Navigator.pushNamed(context, "Statistics");
        },
      ),
    );
  }
}
 

 