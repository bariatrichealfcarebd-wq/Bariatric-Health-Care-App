// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports automáticos

import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class GraficoEvolucaoPeso extends StatefulWidget {
  const GraficoEvolucaoPeso({
    Key? key,
    this.width,
    this.height,
    required this.datas,
    required this.pesos,
    required this.lineColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<DateTime> datas;
  final List<double> pesos;
  final Color lineColor;

  @override
  _GraficoEvolucaoPesoState createState() => _GraficoEvolucaoPesoState();
}

class _GraficoEvolucaoPesoState extends State<GraficoEvolucaoPeso> {
  @override
  Widget build(BuildContext context) {
    if (widget.datas.isEmpty ||
        widget.pesos.isEmpty ||
        widget.datas.length != widget.pesos.length) {
      return Container(
        width: widget.width,
        height: widget.height,
        // COR DE FUNDO PADRÃO para o widget
        color: Colors.white,
        child: const Center(
            child: Text("Sem dados suficientes",
                style: TextStyle(color: Colors.grey))),
      );
    }

    // 1. Preparar os pontos
    List<FlSpot> spots = [];
    for (int i = 0; i < widget.datas.length; i++) {
      spots.add(FlSpot(
          widget.datas[i].millisecondsSinceEpoch.toDouble(), widget.pesos[i]));
    }

    // 2. ORDENAR (Garante a ordem cronológica exata: dia, hora, minuto)
    spots.sort((a, b) => a.x.compareTo(b.x));

    return Container(
      width: widget.width,
      height: widget.height,
      // CONFIGURAÇÃO DO FUNDO
      color: Colors.white,
      child: LineChart(
        LineChartData(
          // Fundo da área de plotagem (opcional, pode ser removido se o Container já tiver cor)
          backgroundColor: Colors.white,

          // Grade
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                  // ALTERADO: Cor das linhas de grade para um Cinza médio (mais visível)
                  color: Colors.grey,
                  strokeWidth: 1);
            },
          ),

          // Títulos (Eixos)
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 5,
                reservedSize: 50,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          // CORRIGIDO: Cor preta para os pesos (Eixo Y)
                          color: Colors.black));
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 86400000 * 5, // ~5 dias
                getTitlesWidget: (value, meta) {
                  final date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      DateFormat('dd/MM').format(date),
                      style: const TextStyle(
                          fontSize: 12,
                          // CORRIGIDO: Cor preta para as datas (Eixo X)
                          color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),

          borderData: FlBorderData(show: false),

          // CONFIGURAÇÃO DA LINHA
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              preventCurveOverShooting: true,
              color: widget.lineColor,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: widget.lineColor.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
