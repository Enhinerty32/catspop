import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(context, 'Skills');
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
      appBar: AppBar(title: Text('CatsPop')),
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
