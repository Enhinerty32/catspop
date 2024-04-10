import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
 
 
import 'dart:math';

import 'package:flutter/material.dart';

class ImproveYourselfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista de URLs de GIFs aleatorios
    
  List<String> content =  [
  "Comunicación:\n- Practica hablar en público frente a un espejo.\n- Participa en debates o discusiones grupales.\n- Graba tus discursos o presentaciones y luego analízalos para identificar áreas de mejora.",

  "Lenguaje corporal:\n- Realiza ejercicios de expresión facial frente a un espejo.\n- Practica mantener una postura abierta y segura en diferentes situaciones.\n- Observa videos de personas con un fuerte lenguaje corporal y trata de imitar sus gestos.",

  "Valor:\n- Enfrenta tus miedos gradualmente, estableciendo pequeños objetivos que te desafíen.\n- Reflexiona sobre tus logros pasados y reconoce tus fortalezas.\n- Visualiza situaciones desafiantes y practica cómo responderías con valentía.",

  "Empatía:\n- Participa en actividades de voluntariado para conectarte con diferentes realidades y perspectivas.\n- Practica la escucha activa repitiendo lo que la otra persona ha dicho para asegurarte de entenderla correctamente.\n- Practica ponerse en el lugar de otra persona y considerar cómo se sienten o piensan en una situación particular.",

  "Carisma:\n- Practica el uso de historias y anécdotas para conectar con los demás.\n- Desarrolla tu sentido del humor y practica contar chistes o anécdotas divertidas.\n- Trabaja en tu confianza personal y proyecta una actitud positiva y segura.",

  "Escucha activa:\n- Prueba la técnica de \"parroting\", repitiendo las palabras clave que la otra persona ha dicho para demostrar que estás prestando atención.\n- Haz preguntas abiertas para alentar a la otra persona a compartir más detalles sobre sus pensamientos y sentimientos.\n- Practica la empatía reflexionando sobre lo que la otra persona podría estar sintiendo en base a lo que han compartido.",

  "Control emocional:\n- Practica técnicas de respiración profunda para calmarte en momentos de estrés o ansiedad.\n- Aprende a identificar tus emociones y expresarlas de manera saludable.\n- Practica la meditación para aumentar tu conciencia emocional y tu capacidad para manejar las emociones difíciles.",

  "Tacto:\n- Practica dar abrazos o apretones de manos cálidos y sinceros.\n- Trabaja en tu habilidad para leer las señales de los demás y determinar si están cómodos con el contacto físico.\n- En situaciones apropiadas, practica el contacto físico suave, como poner una mano en el hombro de alguien durante una conversación.",

  "Sexualización:\n- Practica mantener un lenguaje y comportamiento respetuoso y apropiado en situaciones sociales.\n- Trabaja en tu capacidad para establecer conexiones emocionales antes de intentar cualquier tipo de avance sexual.\n- Presta atención a las señales de consentimiento y asegúrate de que todas las interacciones sean mutuamente deseables y confortables."
];
    return Scaffold(
      appBar: AppBar(
        title: Text('Mejorate a ti mismo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: content.length, // Cambia el número según cuántos GIFs quieras mostrar
          itemBuilder: (context, index) {
            // Selecciona un GIF aleatorio de la lista de URLs 
            String imgURL = 'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZ2ptbGVkcXNuZmdvbmQ3dXE1b3oxaGRrMDNvYWhhNGtwNjdwb2NhbSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/uq1QEVIXxMh4k/giphy.gif';
            double sizeContainer=140;
        
            return Card(
              child: Row(
                children: [
                  Container(padding: EdgeInsets.all(5),height:sizeContainer , width: sizeContainer ,child: Image.network(imgURL)),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(width: 160,child: Tooltip(message: '${content[index]}',child: Text(softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 7,'${content[index]}'))),
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
 
