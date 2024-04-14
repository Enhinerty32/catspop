
import 'package:flutter/material.dart';

class RedBlueLine extends StatelessWidget {
  final List<int> dataList;

  RedBlueLine({required this.dataList});

  @override
  Widget build(BuildContext context) { 
    
  // Contar la cantidad de veces que aparece cada valor en la lista
  int cantidadCeros = dataList.where((element) => element == 0).length;
  int cantidadUnos = dataList.where((element) => element == 1).length;
  
  // Calcular el total de elementos en la lista
  int totalElementos = dataList.length;
  
  // Calcular el porcentaje de ceros y unos
  double Pz = (cantidadCeros / totalElementos) ;
  double Po = (cantidadUnos / totalElementos)  ;
  
  // Mostrar resultados
  //  print('Porcentaje de ceros: $Pz%');
 // print('Porcentaje de unos:  $Po%');
    return Container(  
      height: 40, 
      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            
            child:(Pz == Po) ? Icon(Icons.sync_alt) : (Pz > Po ? Icon(Icons.keyboard_double_arrow_up) : Icon(Icons.keyboard_double_arrow_down)),

            width:150*Pz, 
            decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            color: Colors.blue),
          ),
          Container(width: 4,),
          Container(
            child:  (Pz == Po) ? Icon(Icons.sync_alt) : (Pz < Po ? Icon(Icons.keyboard_double_arrow_up) : Icon(Icons.keyboard_double_arrow_down)),
            width:150*Po,
            decoration: BoxDecoration(
            
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            color: Colors.red),
          ) ,
             
          
        ],
      ),
    );
  }
}
 