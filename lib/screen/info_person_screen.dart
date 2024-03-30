import 'dart:math';

import 'package:catspop/screen/menstrual_cycle_screen.dart';
import 'package:catspop/screen/screens.dart';
import 'package:catspop/widget/analytic_widget.dart'; 
import 'package:catspop/widget/view_cycle_widget.dart';
import 'package:catspop/widget/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';



class InfoPersonScreen extends StatefulWidget {
  const InfoPersonScreen({Key? key}) : super(key: key);
 
  @override
  State<InfoPersonScreen> createState() => _InfoPersonScreenState();
}

class _InfoPersonScreenState extends State<InfoPersonScreen> {
  final dateMenstrualCycle = DateTime.parse('2024-03-01');
  final List<List<String>> myItemList = [
    ['Que le hace sentir Bien?',
      'Deporte',
      'Chistes',
      'Anime',
      'kpop',
      'Parangaricuirimicfsdfasdasdfasdfasdfasd asdfasdfa asdfasdfas asdfasdfa asdf sa dafsdafuaro',
      'Chistes',
      'Anime',
      'kpop',
      'Deporte',
      'Comer tofu',
      'kpop',
      'Parangaricuirimicfsdfasdfuaro',
      'Chistes',
      'Anime',
      'Deporte',
    ],
    ['Que siente que Necesesita?','Comida', 'sexo', "religion", "amigos"],
    ['Que le hace sentir Mal?',
      'Perros',
      'tarantulas',
      'peliculas de terrro',
      "el vecino",
      "crisis econonima"
    ],
  ]; 

  List<bool>checksTrush=[true,false,true,false,true,false];

  final List<bool> _isOpen = [false, false, false]; // Initial expanded state

//SetState of ExpasionList
  void _toggleExpansion(int index) {
    setState(() {
      _isOpen[index] = !_isOpen[index];
    });
  }

  Widget build(BuildContext context) {
    MediaQueryData mediaquery = MediaQuery.of(context);

    final List<Widget> pricipalsWidget = [
       
      secondOne(),
      thirdOne(), 
      fifthOne(checksTrush)
      
    ];
    return Scaffold(
        body: CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        const SliverAppBar(
          title: Text('Karla Elizabet'),
        ),
        SliverToBoxAdapter(child: firstOne()),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return pricipalsWidget[index];
        }, childCount: pricipalsWidget.length)),
        // Wishes,Troubles,Needs
        sixthOne(),
      
      SliverToBoxAdapter(child: 
      fourthOne(),),
        // widget Analisis de Interacion
        //AnalyticWidget().analyticResult(context),

      ],
    ));
  }

  SliverToBoxAdapter sixthOne() {
    return SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpasionPanelListCategory(  itemsLists: myItemList),
      ));
  }

  Widget fifthOne(List<bool> checks) {
  double sizeBox =50;
  List<String> itemTexts = [
    'Comunicación de Sentimientos y Emociones:\n\nEste nivel se centra en la apertura emocional y la capacidad de comunicar libremente los sentimientos y emociones. Es fundamental establecer una base sólida de confianza emocional antes de avanzar hacia niveles más íntimos',
    'Compartir Experiencias Personales y Pasatiempos:\n\nAquí, la pareja comienza a construir confianza a través de la participación en actividades juntos y compartiendo experiencias personales. Esto ayuda a fortalecer el vínculo y a crear un sentido de conexión más profundo.',
    'Apoyo Mutuo en Momentos de Vulnerabilidad: \n\nEn este nivel, la confianza se profundiza cuando la pareja demuestra estar presente y ofrecer apoyo incondicional durante momentos de vulnerabilidad o dificultad. Es importante sentirse seguros y respaldados por la otra persona en todas las circunstancias.',
    'Exploración de la Intimidad Física No Sexual: \n\n Aquí, la pareja comienza a explorar la intimidad física de una manera no sexual, como abrazos, caricias y besos. Esta etapa ayuda a construir confianza física y a establecer límites saludables dentro de la relación.',
    'Construcción de Intimidad Sexual:\n\n Este nivel implica la exploración y el desarrollo de la intimidad sexual entre la pareja. Es importante comunicarse abierta y honestamente sobre deseos, necesidades y límites para asegurar una experiencia mutuamente satisfactoria y respetuosa.',
    'Confianza Total :\n\nFinalmente, la pareja alcanza un nivel de confianza total donde se sienten cómodos y seguros expresando plenamente su sexualidad el uno con el otro. Esto implica un profundo respeto mutuo, comunicación clara y una conexión emocional sólida.'
  ];

  List<Color?> itemsColors = [
    Colors.white,
    Color.fromARGB(255, 118, 169, 195),
    Color.fromARGB(255, 139, 110, 189),
    Color.fromARGB(255, 255, 104, 155),
    Color.fromARGB(255, 251, 52, 38),
    Colors.yellow
  ];

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        Text("Nivel de confianza", style: TextStyle(fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(itemTexts.length, (index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Tooltip(
                    message: itemTexts[index],
                    child: Container(
                      decoration: BoxDecoration(
                        color: itemsColors[index],
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: sizeBox,
                      width:  sizeBox,
                    ),
                  ),
                  if (index < checks.length && checks[index])
                    Icon(Icons.check_circle, color: Colors.black, size: 30),
                ],
              );
            }),
          ),
        ),
      ],
    ),
  );
}


  Widget fourthOne() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(15),
    child: StatisticsPersonScreen().CircleGrafics(),
  );
}


Widget ExpasionPanelListCategory({required List<List<String>> itemsLists}) {
  return ExpansionPanelList(
    expandedHeaderPadding: EdgeInsets.all(5),
    expansionCallback: (i, isopen) {
      _toggleExpansion(i);
    },
    children: itemsLists.map<ExpansionPanel>((itemsList) {
      int index = itemsLists.indexOf(itemsList);
      return ExpansionPanel(canTapOnHeader: true,
        backgroundColor: index == 0 ? Colors.yellow : index == 1 ? Colors.blueGrey.shade200 : Colors.redAccent,
        headerBuilder: (context, isopen) {
          return ListTile(
            leading: Icon(Icons.arrow_right, color: Colors.white),
            title: Text(
              '${itemsList[0]}',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
        },
        body: ThoughtsCategoryWidget(
          specials: itemsList,
        ),
        isExpanded: _isOpen[index],
      );
    }).toList(),
  );
}



  
Widget thirdOne() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.purple[200],
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Descripcion', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(
          'oluptate aute elit Lorem sunt et ut mollit officia voluptate. Ad mollit velit amet dolore eiusmod magna. Aliquip labore sunt qui eiusmod sint aliquip amet nisi reprehenderit in in proident nulla sint. Duis sit nostrud sunt dolor dolor ea. Exercitation dolor esse excepteur ullamco aliquip proident excepteur voluptate cillum. Aliqua Lorem reprehenderit velit aliquip pariatur velit qui aliquip.',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}


 
Widget secondOne() {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 166, 196),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    margin: EdgeInsets.all(10),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Menstrual cycle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ViewCycleWidget(dateReferenceStartBleed: dateMenstrualCycle, now: DateTime.now()),
          SizedBox(height: 6),
        ],
      ),
    ),
  );
}

Widget firstOne() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    margin: EdgeInsets.all(10),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/fotos-premium/retrato-al-aire-libre-mujer-hermosa-desnuda_218872-3015.jpg?w=360'),
          ),
          SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Estados civil: Soltera", style: TextStyle(color: Colors.white )),
                Text("Creencias: Cristiana", style: TextStyle(color: Colors.white)),
                Tooltip(
                  showDuration: Duration(minutes: 1),
                  message: '14 de julio de 1996',
                  child: Text('Edad : 19', style: TextStyle(color: Colors.white)),
                ),
                Text('Numero: 95067834', style: TextStyle(color: Colors.white)),
                Text('Ocupacion: Contadora', style: TextStyle(color: Colors.white)),
                Text('Metas: Poner su propia tienda', style: TextStyle(color: Colors.white)),
                Text('Sangre: A+', style: TextStyle(color: Colors.white)),
                Tooltip(
                  message: 'Lugar donde trabaja',
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.location_on_outlined, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}



  Widget zeroOne() {
    return Container(
      color: Colors.yellow,
      height: 200,
      alignment: Alignment.center,
      child: Text('Image'),
    );
  }
}
 