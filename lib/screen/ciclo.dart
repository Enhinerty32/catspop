import 'dart:async';
import 'package:flutter/material.dart';

class MenstrualCycleWidget extends StatefulWidget {
  /// Fecha de inicio de la menstruación actual.
  final DateTime startDate;

  /// Ancho total de la barra del ciclo menstrual.
  final double totalSide;

  /// Color personalizado para la sección de días de sangrado.
  final Color? redColor;

  /// Color personalizado para la sección de días fértiles.
  final Color? greenColor;

  /// Color personalizado para la sección de otros días.
  final Color? blueColor;

  const MenstrualCycleWidget({
    Key? key,
    required this.startDate,
    required this.totalSide,
    this.redColor,
    this.greenColor,
    this.blueColor,
  }) : super(key: key);

  @override
  State<MenstrualCycleWidget> createState() => _MenstrualCycleWidgetState();
}

class _MenstrualCycleWidgetState extends State<MenstrualCycleWidget> {
  /// Fecha de la próxima menstruación (calculada a partir de la fecha de inicio).
  late DateTime _nextMenstruationDate;

  /// Día actual del ciclo (calculado a partir de la fecha de inicio y la fecha actual).
  late int _currentDay;

  /// Indica si la usuaria está en la fase de sangrado (primeros 5 días del ciclo).
  late bool _isMenstruating;

  @override
  void initState() {
    super.initState();

    // Calcular la fecha de la próxima menstruación
    _nextMenstruationDate = widget.startDate.add(const Duration(days: 28));

    // Calcular el día actual del ciclo
    _currentDay = DateTime.now().difference(widget.startDate).inDays;

    // Determinar si la usuaria está en la fase de sangrado
    _isMenstruating = _currentDay <= 5;

    // Iniciar un temporizador para reiniciar _currentDay y _isMenstruating cada 28 días
    Timer.periodic(const Duration(days: 28), (_) => _resetState());
  }

  /// Reinicia _currentDay y _isMenstruating al inicio de un nuevo ciclo.
  void _resetState() {
    _currentDay = 0;
    _isMenstruating = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ciclo Menstrual'),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    // Línea azul que indica el día actual del ciclo
                    _buildCurrentCycleLine(),

                    // Secciones de la barra del ciclo: Sangrado, Fértil y Otros Días
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildRedSection(),
                        _buildGreenSection(),
                        _buildWhiteSection(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(_nextMenstruationDate.toString().substring(0, 10)),
          ],
        ),
      ],
    );
  }

  /// Construye la sección de días de sangrado.
  Widget _buildRedSection() {
    return Container(
      width: widget.totalSide * 5 / 28,
      color:
          _isMenstruating ? widget.redColor ?? Colors.red : Colors.transparent,
    );
  }

  /// Construye la sección de días fértiles.
  Widget _buildGreenSection() {
    return Container(
      width: widget.totalSide * 6 / 28,
      color: widget.greenColor ?? Colors.green,
    );
  }

  /// Construye la sección de otros días.
  Widget _buildWhiteSection() {
    return Container(
      width: widget.totalSide * 17 / 28,
      color: Colors.white,
    );
  }

  /// Construye la línea azul que indica el día actual del ciclo.

  Widget _buildCurrentCycleLine() {
    // Calcular posición y color de la línea azul
    double position = _currentDay / 28 * widget.totalSide;
    Color color = widget.blueColor ?? Colors.blue;

    return Positioned(
      left: position,
      top: 0,
      bottom: 0,
      child: Container(
        width: 2,
        color: color,
      ),
    );
  }
}
