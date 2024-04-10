import 'package:catspop/screen/test.dart';
import 'package:flutter/material.dart';
import 'package:catspop/screen/screens.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // Customize these values to match your desired look and feel
  primaryColor: Colors.black, 
  cardColor: Colors.grey[800],
  canvasColor: Colors.black,
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.white),
  ),
  tooltipTheme: TooltipThemeData(
    showDuration: Duration(minutes: 20),
  ),
  cardTheme: CardTheme(
    elevation: 3.5,
  ),
);



    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      initialRoute:  'Home',
      theme:  darkTheme,   routes: {
        'Home': (BuildContext context) => const HomeScreen(),
        'InfoPerson': (BuildContext context) => const InfoPersonScreen(),
        
        'test': (BuildContext context) => const test(),
        'Statistics': (BuildContext context) =>   StatisticsPersonScreen()
        ,
        'Tricks': (BuildContext context) =>   TricksScreen(),
        'ImproveYourself': (BuildContext context) =>   ImproveYourselfScreen()
      },
    );
  }
}
// ThemeData(tooltipTheme: TooltipThemeData(showDuration: Duration(minutes: 20)),cardTheme: CardTheme(elevation: 3.5)),
    