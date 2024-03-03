import 'dart:math';

import 'package:catspop/widget/analytic_widget.dart';
import 'package:flutter/material.dart';

class InfoPersonScreen extends StatefulWidget {
  const InfoPersonScreen({Key? key}) : super(key: key);

  @override
  State<InfoPersonScreen> createState() => _InfoPersonScreenState();
}

class _InfoPersonScreenState extends State<InfoPersonScreen> {
  @override
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
        SliverAppBar(
          title: Text('asdf'),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return pricipalsWidget[index];
        }, childCount: pricipalsWidget.length)),
        fourthOne(),
        // widget Analisis de Interacion
         AnalyticWidget().analyticResult(context)
      ],
    ));
  }

    Widget fourthOne() {
    final List<String> specials = [
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
    ];
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 180,
        child: GridView.builder( 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: specials.length,
          itemBuilder: (context, index) {
            return Tooltip(
              showDuration: Duration(minutes: 1),
              message: '${specials[index]}',
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  color: Colors.amberAccent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(7),
                    child: Text(
                      '${specials[index]}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
            );
          },
        ),
      ),
    );
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


