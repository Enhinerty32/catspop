import 'dart:math';

import 'package:catspop/widget/analytic_widget.dart';
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

  final List<List<String>> myItemList = [
    [
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
    ['Comida', 'sexo',"religion","amigos"],
    ['Perros', 'tarantulas', 'peliculas de terrro',"el vecino","crisis econonima"],
  ]; 

  

  final List<String> myTitles = ['Deseos', 'Necesidades', 'Miedos'];



  final List<bool> _isOpen = [false,false,false]; // Initial expanded state

//SetState of ExpasionList
  void _toggleExpansion(int index) {
    setState(() {
      _isOpen[index] = !_isOpen[index];
    });
  }
  Widget build(BuildContext context) {
    MediaQueryData mediaquery = MediaQuery.of(context);

    final List<Widget> pricipalsWidget = [
     firstOne(),
      secondOne(),
      thirdOne(),
    ];
    return Scaffold(
        body: CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        const SliverAppBar(
          title: Text('asdf'),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return pricipalsWidget[index];
        }, childCount: pricipalsWidget.length)),
          // Wishes,Troubles,Needs
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpasionPanelListCategory(itemTittles: myTitles ,itemsLists: myItemList),
          )),
        // widget Analisis de Interacion
         AnalyticWidget().analyticResult(context),
       

        // SliverToBoxAdapter(
        //   child: ThoughtsCategoryWidget(specials: [
        //         'Deporte',
        //         'Chistes',
        //         'Anime',
        //         'kpop',
        //         'Parangaricuirimicfsdfasdasdfasdfasdfasd asdfasdfa asdfasdfas asdfasdfa asdf sa dafsdafuaro',
        //         'Chistes',
        //         'Anime',
        //         'kpop',
        //         'Deporte',
        //         'Comer tofu',
        //         'kpop',
        //         'Parangaricuirimicfsdfasdfuaro',
        //         'Chistes',
        //         'Anime',
        //         'Deporte',
        //       ],),
        // ),
   
        // SliverToBoxAdapter(child: ThoughtsCategoryWidget(specials: ['gatos'],)),
      ],
    ));
  }


 

  Widget ExpasionPanelListCategory({required List<List<String>> itemsLists,required List<String> itemTittles}) {
     
    
    return ExpansionPanelList(expandedHeaderPadding:EdgeInsets.all(5) ,
      expansionCallback: (i, isopen) {
    _toggleExpansion(i);} ,children: [



    ExpansionPanel(backgroundColor: Colors.yellow,headerBuilder: (context, isopen) {return
         Center(child: Text('${itemTittles[0]}'));
      
    }, body:ThoughtsCategoryWidget(specials:itemsLists[0],),isExpanded: _isOpen[0])
    ,
  
    ExpansionPanel(backgroundColor: Colors.blueGrey.shade200,headerBuilder: (context, isopen) {return
         Center(child: Text('${itemTittles[1]}'));
      
    }, body:ThoughtsCategoryWidget(specials:itemsLists[1],),isExpanded: _isOpen[1])
    ,  ExpansionPanel(backgroundColor: Colors.redAccent,headerBuilder: (context, isopen) {return
         Center(child: Text('${itemTittles[2]}'));
      
    }, body:ThoughtsCategoryWidget(specials:itemsLists[2],),isExpanded: _isOpen[2])
    ,
    
    
    
    ],);
  }

   

  Widget thirdOne() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.purple[200],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Descripcion'),
          SizedBox(height: 5),
          Text(
              'Esse voluptate aute elit Lorem sunt et ut mollit officia voluptate. Ad mollit velit amet dolore eiusmod magna. Aliquip labore sunt qui eiusmod sint aliquip amet nisi reprehenderit in in proident nulla sint. Duis sit nostrud sunt dolor dolor ea. Exercitation dolor esse excepteur ullamco aliquip proident excepteur voluptate cillum. Aliqua Lorem reprehenderit velit aliquip pariatur velit qui aliquip.')
        ],
      ),
    );
  }

  Widget secondOne() {
    return Container(
      color: Color.fromARGB(255, 255, 166, 196),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Heat schedule'),
            SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }

  Widget firstOne() {
    return Container(
      color: Colors.blue,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/fotos-premium/retrato-al-aire-libre-mujer-hermosa-desnuda_218872-3015.jpg?w=360')),
                SizedBox(
                  width: 15,
                ),
                Text(softWrap: true, maxLines: 4, "Name"),
              ],
            ),
            Expanded(child: SizedBox()),
            Tooltip(
              showDuration: Duration(minutes: 1),
              message: '14 de julio de 1996',
              child: Text(
                '19 ',
              ),
            ),
            Tooltip(
              message: 'Touchme',
              child: Text('data'),
            )
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


