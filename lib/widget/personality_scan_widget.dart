import 'package:flutter/material.dart';

class PersonalityScanWidget extends StatelessWidget {
    PersonalityScanWidget({super.key});


 Map<String, List<int>>  dimenciones = {
    "E-I": [0, 0, 0, 0],    // Extraversion (E) = 1   Introversion (I) = 0
    "S-N": [0, 0, 1, 0],    // Sensacion    (S) = 1   Intuicion    (N) = 0
    "T-F": [0, 0, 0, 1],    // Pensamiento  (T) = 1   Sentimiento  (F) = 0
    "J-P": [0, 0, 1 , 1, 1],// Juicio       (J) = 1   Persepcion   (P) = 0
    };

    Map<String, List<int>> dimensionss = {
    "E-I": [0, 0, 0, 0, 1], // Extraversión (E) = 1, Introversión (I) = 0
    "S-N": [0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0], // Sensación (S) = 1, Intuición (N) = 0
    "T-F": [0, 0, 0, 1, 0, 0], // Pensamiento (T) = 1, Sentimiento (F) = 0
    "J-P": [0, 0, 1, 1], // Juicio (J) = 1, Percepción (P) = 0
  };
  @override
  Widget build(BuildContext context) {
   final resultlist= determineResultDimensions(dimenciones);
    return Row(children: [
      Container(alignment: Alignment.center,decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.all(Radius.circular(10)))
    ,width: 150,height: 100,child: Text('${ resultlist}',style: TextStyle(fontSize: 40),),)
    ,
    
    ],);
  }

String determineResultDimensions(Map<String, List<int>> dimensions) {
  Map<String, int> count = {}; // Map to count the number of 1s and 0s

  // Iterate over each dimension in the map
  dimensions.forEach((key, value) {
    int ones = value.where((element) => element == 1).length; // Count the number of 1s
    int zeros = value.where((element) => element == 0).length; // Count the number of 0s

    // Determine the corresponding letter based on the rules
    String letter = ones > zeros ? key.split('-')[0] : zeros > ones ? key.split('-')[1] : 'P';

    // Increase the count for that letter
    count.update(letter, (value) => value + 1, ifAbsent: () => 1);
  });

  // Build the final response based on the count
  String response = '';
  count.forEach((key, value) {
    response += value > dimensions.length / 2 ? key : key.toLowerCase();
  });

  return response.toUpperCase();
}

}
