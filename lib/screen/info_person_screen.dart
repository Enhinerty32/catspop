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
  
final TextStyle titleTextStyle = TextStyle( fontSize: 16);

final TextStyle fillTextStyle = TextStyle( );

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

  List<bool>checksTrush=[true,false,true,false,false,false];

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
      fifthOne(checksTrush), 
      SeventhOne()
      
    ];
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
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
              ),
        ));
  }

  SliverToBoxAdapter sixthOne() {
    return SliverToBoxAdapter(
          child: ExpasionPanelListCategory(  itemsLists: myItemList));
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

  return Card(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackgroundTextContainer(child: Text("Nivel de confianza", style: titleTextStyle ,)),
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
  return Card(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [BackgroundTextContainer(child: Text("Preferecias sentimentales",style: titleTextStyle,)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StatisticsPersonScreen().CircleGrafics(),
        ),
      ],
    ),
  );
}


Widget ExpasionPanelListCategory({required List<List<String>> itemsLists}) {
  return Card(
    child: Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [BackgroundTextContainer(child: Text("Obcervaciones",style: titleTextStyle,)),
        ExpansionPanelList(dividerColor: Colors.transparent,expandIconColor: Colors.transparent,
          elevation: 0,
          
          expansionCallback: (i, isopen) {
            _toggleExpansion(i);
          },
          children: itemsLists.map<ExpansionPanel>((itemsList) {
            int index = itemsLists.indexOf(itemsList);
            return ExpansionPanel( backgroundColor: Colors.transparent,canTapOnHeader: true, 
              headerBuilder: (context, isopen) {
                return  Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(color: ThemeData().focusColor,borderRadius: BorderRadius.circular(10)),
                    child: Text( 
                          '${itemsList[0]}',  
                        )),
                );
                
              },
              body: ThoughtsCategoryWidget(
                specials: itemsList,
              ),
              isExpanded: _isOpen[index],
            );
          }).toList(),
        ),
      ],
    ),
  );
}
 
  
Widget thirdOne() {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackgroundTextContainer(child: Text('Descripcion', style:  titleTextStyle)),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'oluptate aute elit Lorem sunt et ut mollit officia voluptate. Ad mollit velit amet dolore eiusmod magna. Aliquip labore sunt qui eiusmod sint aliquip amet nisi reprehenderit in in proident nulla sint. Duis sit nostrud sunt dolor dolor ea. Exercitation dolor esse excepteur ullamco aliquip proident excepteur voluptate cillum. Aliqua Lorem reprehenderit velit aliquip pariatur velit qui aliquip.',
            
          ),
        ),
      ],
    ),
  );
}


 
Widget secondOne() {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackgroundTextContainer(child: Text("Menstrual cycle", style:  titleTextStyle)),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ViewCycleWidget(dateReferenceStartBleed: dateMenstrualCycle, now: DateTime.now()),
        ),
        SizedBox(height: 6),
      ],
    ),
  );
}

Widget firstOne() {
  return Card(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackgroundTextContainer(child: Text('Profile',style: titleTextStyle,)),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                    Text("Estados civil: Soltera", ),
                    Text("Creencias: Cristiana",   ),
                    Tooltip(
                      showDuration: Duration(minutes: 1),
                      message: '14 de julio de 1996',
                      child: Text('Edad : 19',),
                    ),
                    Text('Numero: 95067834', ),
                    Text('Ocupacion: Contadora', ),
                    Text('Metas: Poner su propia tienda', ),
                    Text('Sangre: A+',),
                    Row(
                      children: [  Tooltip(
                      message: 'Lugar donde vive',
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.location_on_outlined, ),
                      ),
                    ),
                        Tooltip(
                          message: 'Lugar donde trabaja',
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.location_on_outlined,  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget SeventhOne() {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackgroundTextContainer(child: Text('MBTI Personalidad', style:  titleTextStyle)),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PersonalityScanWidget(),
        ),
      ],
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
 
 
Widget BackgroundTextContainer({required Text child , Color ?color}){
return  Container(
padding: EdgeInsets.all(2),
decoration: BoxDecoration( color: color??ThemeData().primaryColor.withOpacity(0.5),borderRadius: BorderRadius.only(topLeft: Radius.circular(12.3),bottomRight: Radius.circular(12.3)) ),
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: child,
),);
}