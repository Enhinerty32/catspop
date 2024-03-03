import 'package:catspop/screen/test.dart';
import 'package:flutter/material.dart';
import 'package:catspop/screen/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      initialRoute:  'InfoPerson',
      theme: ThemeData.light(),
      routes: {
        'Home': (BuildContext context) => const HomeScreen(),
        'InfoPerson': (BuildContext context) => const InfoPersonScreen(),
        
        'test': (BuildContext context) => const test(),
        'Statistics': (BuildContext context) =>   StatisticsPersonScreen()
      },
    );
  }
}
