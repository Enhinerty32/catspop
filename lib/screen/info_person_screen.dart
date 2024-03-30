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
    height: 100,
    child: Column(
      children: [
        Text("Nivel de confianza"),
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
                      height: 60,
                      width: 60,
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

  Widget fourthOne() => StatisticsPersonScreen().CircleGrafics();

  Widget ExpasionPanelListCategory(
      {required List<List<String>> itemsLists,
       }) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.all(5),
      expansionCallback: (i, isopen) {
        _toggleExpansion(i);
      },
      children: [
        ExpansionPanel(
            backgroundColor: Colors.yellow,
            headerBuilder: (context, isopen) {
              return Center(child: Text('${itemsLists[0][0]}'));
            },

            //Usar customList Para modificar datos de las lista
            body: ThoughtsCategoryWidget(
              specials: itemsLists[0],
            ),
            isExpanded: _isOpen[0]),
        ExpansionPanel(
            backgroundColor: Colors.blueGrey.shade200,
            headerBuilder: (context, isopen) {
              return Center(child: Text('${itemsLists[1][0]}'));
            },
            body: ThoughtsCategoryWidget(
              specials: itemsLists[1],
            ),
            isExpanded: _isOpen[1]),
        ExpansionPanel(
            backgroundColor: Colors.redAccent,
            headerBuilder: (context, isopen) {
              return Center(child: Text('${itemsLists[2][0]}'));
            },
            body: ThoughtsCategoryWidget(
              specials: itemsLists[2],
            ),
            isExpanded: _isOpen[2]),
      ],
    );
  }

 Widget thirdOne() {
  return Container(
    padding: EdgeInsets.all(10),
    color: Colors.purple[200],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Descripcion'),
        SizedBox(height: 5),
        Text(
          'oluptate aute elit Lorem sunt et ut mollit officia voluptate. Ad mollit velit amet dolore eiusmod magna. Aliquip labore sunt qui eiusmod sint aliquip amet nisi reprehenderit in in proident nulla sint. Duis sit nostrud sunt dolor dolor ea. Exercitation dolor esse excepteur ullamco aliquip proident excepteur voluptate cillum. Aliqua Lorem reprehenderit velit aliquip pariatur velit qui aliquip.'
        ),
      ],
    ),
  );
}

 

  Widget secondOne() {
  return Container(
    color: Color.fromARGB(255, 255, 166, 196),
    child: Padding(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Menstrual cycle"),
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
    color: Colors.blue,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/fotos-premium/retrato-al-aire-libre-mujer-hermosa-desnuda_218872-3015.jpg?w=360'),
            ),
            SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Estados civil: Soltera"),
                const Text("Creencias: Cristiana"),
                const Tooltip(
                  showDuration: Duration(minutes: 1),
                  message: '14 de julio de 1996',
                  child: Text('Edad : 19'),
                ),
                Text('Numero: 95067834'),
                Text('Ocupacion: Contadora'),
                Text('Metas: Poner su propia tienda'),
                Text('Sangre: A+'),
               Row(children: [ 
                // MapButton(),
                  Tooltip(
                  message: 'Lugar donde trabaja  ',
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(size: 30, Icons.location_on_outlined),
                  ),
                ),],)
              ],
            ),
          ],
        ),
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
 