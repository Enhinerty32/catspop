import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
 
 
import 'dart:math';

import 'package:flutter/material.dart';

class TricksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista de URLs de GIFs aleatorios
    List<String> urls = [
      'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMHQ0bzE4bjAxdHZjcDd5ODU4cHR6ZWNhNm40N2IwcWo1d3Qydzl1MCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xUySTLvZk6WchApxWo/giphy.gif',
      'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYjh4MHJ0MGxjZTF5ZjFpdno1a3c4azQyY202Z2l2MHdwM3R1bjJ1YSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PWP86D0d8kLTO/giphy.gif',
      'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExc2xjM3IzYXoyZjRsNGxpaXBjZHRiN3lvMXZheGZ5MnI4NTNrNmV6dSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/abZ5exGrse0W4/giphy.gif',
      'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExZ25sOXIzM2RlZTZra3pkYW4wbjNpZjF5dngzMnV6eThrNWRvcDMwcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l0MYu2xpvAHEEoY2k/giphy.gif',
      // Agrega más URLs de GIFs aleatorios aquí
    ];
  List<String> content = [
      'Negging: Hacer comentarios ligeramente despectivos disfrazados de halagos para captar la atención de la persona que se quiere seducir.',
      'Push and Pull: Alternar entre mostrar interés y retirar atención de manera intermitente para mantener a la otra persona interesada y buscando aprobación.',
      'Apertura indirecta: Iniciar una conversación de manera sutil utilizando preguntas o comentarios aparentemente inocentes o intrigantes en lugar de abordajes directos.',
      'Escalada física: Aumentar gradualmente el contacto físico durante una interacción para aumentar la intimidad y la conexión emocional.'
      // Agrega más URLs de GIFs aleatorios aquí
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Trucos secretos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: urls.length, // Cambia el número según cuántos GIFs quieras mostrar
          itemBuilder: (context, index) {
            // Selecciona un GIF aleatorio de la lista de URLs 
            String imgURL = urls[index];
            double sizeContainer=170;
        
            return Card(
              child: Row(
                children: [
                  Container(padding: EdgeInsets.all(5),height:sizeContainer , width: sizeContainer ,child: Image.network(imgURL)),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(width: 160,child: Text(softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 7,'${content[index]}')),
                  ), // Cambia el texto para que sea único
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
 
