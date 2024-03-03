import 'package:catspop/widget/mountainGrafic_widget.dart';
import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
    final List<int> perfil1=[3,53,3,0,5,5,5,0,0,12,-12,100];
  final List<int> perfil2 =[3,5,10,3,0,3,-3,-3,3,20,100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:
     SingleChildScrollView(scrollDirection: Axis.horizontal,
     child: Container(
      padding: EdgeInsets.only(top: 20,bottom: 10,right: 20),
     height: 200,width: 400, 
         child: MountainGraficWidget(ticketPercentage: 0.5,margenAltura: 2,isShowingMainData: true,perfil1: perfil1,perfil2: perfil2)) ,
      
     )) );
  }
}