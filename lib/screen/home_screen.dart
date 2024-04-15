import 'package:catspop/provider/people_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {  

    final peopleProvider= Provider.of<PeopleProfileProvider>(context);

    return  Scaffold(
      
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // DrawerHeader(
            //   child: Text('Menú'),
            // ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                // Navegar a la página de inicio
              },
            ),  ListTile(
              title: Text('Trucos Secretos'),
              onTap: () {
                Navigator.pushNamed(context, 'Tricks');
              },
            ),  ListTile(
            title: Text('Mejorate a ti mismo'),
              onTap: () {
                Navigator.pushNamed(context, 'ImproveYourself');
              },
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                // Navegar a la página de configuración
              },
            ), 

          ],
        ),
      ),
      appBar: AppBar(title: Text('CatsPop')  ,),
      body: ListView(children: [
        ListTile(
          
          title: Card(
                child: Padding(
                  padding:   EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                       CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/fotos-premium/retrato-al-aire-libre-mujer-hermosa-desnuda_218872-3015.jpg?w=360'),
                  ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(width: 200,child: 
                        Text(softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 2,'Karla Elizabet')),
                      ), // Cambia el texto para que sea único
                    ],
                  ),
                ),
              ),
              onTap:  ()=>Navigator.pushNamed(context, 'InfoPerson'),
        )],),
    );
  }
}
