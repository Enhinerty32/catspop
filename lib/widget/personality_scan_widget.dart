import 'package:catspop/widget/widgets.dart';
import 'package:flutter/material.dart';

class PersonalityScanWidget extends StatelessWidget {
    PersonalityScanWidget({super.key});


  final Map<String, List<int>>  dimenciones = {
    "E-I": [0, 0, 0, 0],    // Extraversion (E) = 1   Introversion (I) = 0
    "S-N": [0, 0, 1, 0],    // Sensacion    (S) = 1   Intuicion    (N) = 0
    "T-F": [0, 0, 0, 1],    // Pensamiento  (T) = 1   Sentimiento  (F) = 0
    "J-P": [0, 0, 1 , 1, 1],// Juicio       (J) = 1   Persepcion   (P) = 0
    };

  final  Map<String, List<int>> dimensionss = {
    "E-I": [0, 0, 0, 0, 1], // Extraversión (E) = 1, Introversión (I) = 0
    "S-N": [0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0], // Sensación (S) = 1, Intuición (N) = 0
    "T-F": [0, 0, 0, 1, 0, 0], // Pensamiento (T) = 1, Sentimiento (F) = 0
    "J-P": [0, 0, 1, 1], // Juicio (J) = 1, Percepción (P) = 0
  };
  @override
  Widget build(BuildContext context) {

   final resultlist= determineResultDimensions(dimenciones);
   

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(10)))
              ,width: 150,height: 100,child: Text('${ resultlist}',style: TextStyle(fontSize: 40),),)
          ,RadarWidget(),
            
             
        
        ],), 
        SizedBox(height: 8,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [    ElevatedButton(onPressed: (){
          Imageinfo(context);}, child: Text('Info')),
    ElevatedButton(onPressed: (){
               CustomDimensions(context);}, child: Text('dimensiones')),  ],)   ],
    );
  }

  Future<dynamic> CustomDimensions(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context){
          return Container(child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Column(children: [
              SizedBox(height: 20,),
              Row(
                children: [ 
              SizedBox(width: 200,child:    RedBlueLine(dataList: [0,0,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1],)),
                ButtonDimensions(a: "E",b: "I",listDimensions:dimensionss["E-I"]! )
                ],
              ),
              SizedBox(height: 30,),
               Row(
                children: [
                  SizedBox(width: 200,child: RedBlueLine(dataList:[0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,01],)),
               ButtonDimensions(a: "S",b: "N",listDimensions:dimensionss["S-N"]! ),
                ],
              ),
              SizedBox(height: 30,),
               Row(
                children: [
              SizedBox(width: 200,child:      RedBlueLine(dataList: [ 0,1],)),
                ButtonDimensions(a: "T",b: "F",listDimensions:dimensionss["T-F"]! ),
                ],
              ),
              SizedBox(height: 30,),
               Row(
                children: [
                  SizedBox(width: 200,child:  RedBlueLine(dataList: [0,0,1,1,1,1,0,0,0,0,0,0,0,0,01],)) ,
                  ButtonDimensions(a: "J",b: "P",listDimensions:dimensionss["J-P"]! )
                ],
              ),
              ],), 
            ],
          ),);
         });
  }

  Future<dynamic> Imageinfo(BuildContext context) {
    return showModalBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(child: InteractiveViewer(
                        maxScale: 5,
                        minScale: 0.01,
                        boundaryMargin: EdgeInsets.all(20),
                        child: Image.network('https://muchomasqueundivan.com/wp-content/uploads/2022/04/MBTI-1-1536x1536.png')),),
                      SizedBox(height: 50,)
                      , Container(child: InteractiveViewer(
                        maxScale: 5,
                        minScale: 0.01,
                        boundaryMargin: EdgeInsets.all(20),
                        child: Image.network('https://fatimaaguirreconsultora.com/wp-content/uploads/2021/11/tabla_preferencias_mbti.jpg')),),
                       SizedBox(height: 50,),
                       Container(child: InteractiveViewer(
                        maxScale: 5,
                        minScale: 0.01,
                        boundaryMargin: EdgeInsets.all(20),
                        child: Image.network('https://fatimaaguirreconsultora.com/wp-content/uploads/2021/11/tabla_tipos_mbti_2-e1592239103716.jpg')),),
                   
                    ],
                  ),
                );
              },
            );
  }

  Widget ButtonDimensions({required String a ,required String b , required List<int> listDimensions}) {
    // agregar 0 y 1 a la listas en base de datos y reload
    //TODO:aqui un print
return Padding(
  padding: const EdgeInsets.all(5.0),
  child: Row(children: [
     ElevatedButton(onPressed: (){}, child: Text('${a}')),
     SizedBox(width: 10,),
     ElevatedButton(onPressed: (){
      print(listDimensions);
      listDimensions.add(0);
      print(listDimensions);
     }, child: Text('${b}'))

  ],),
);

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
 
  