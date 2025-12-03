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

import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class GraficoOcorrencias extends StatefulWidget {
  const GraficoOcorrencias({
    Key? key,
    this.width,
    this.height,
    required this.ocorrencias,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<GraficosSintomasRecord> ocorrencias;

  @override
  _GraficoOcorrenciasState createState() => _GraficoOcorrenciasState();
}

class _GraficoOcorrenciasState extends State<GraficoOcorrencias> {
  final List<Color> colorPalette = [
    Color(0xFF4B39EF),
    Color(0xFFEE8B60),
    Color(0xFF39D2C0),
    Color(0xFFFF5963),
    Color(0xFF946CFF),
    Color(0xFFFFC107),
    Color(0xFFE91E63),
    Color(0xFF00BCD4),
    Color(0xFF8BC34A),
    Color(0xFF795548),
    Color(0xFF607D8B),
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
    Color(0xFF009688),
    Color(0xFFCDDC39),
    Color(0xFF3F51B5),
    Color(0xFF2196F3),
    Color(0xFFFFEB3B),
    Color(0xFF673AB7),
    Color(0xFFF44336),
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.ocorrencias.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height,
        child: Center(
            child: Text("Sem dados", style: TextStyle(color: Colors.grey))),
      );
    }

    // 1. Agrupamento
    Map<String, List<GraficosSintomasRecord>> dadosAgrupados = {};
    for (var registro in widget.ocorrencias) {
      String nome =
          (registro.nomeSintoma != null && registro.nomeSintoma!.isNotEmpty)
              ? registro.nomeSintoma!
              : 'Outros';
      if (!dadosAgrupados.containsKey(nome)) dadosAgrupados[nome] = [];
      dadosAgrupados[nome]!.add(registro);
    }

    var sortedKeys = dadosAgrupados.keys.toList()..sort();

    // 2. Preparação das Linhas
    List<LineChartBarData> linhasDoGrafico = [];
    double? minDataY;
    double? maxDataY;

    for (int i = 0; i < sortedKeys.length; i++) {
      String nomeSintoma = sortedKeys[i];
      var listaDeRegistros = dadosAgrupados[nomeSintoma]!;
      List<FlSpot> spots = [];

      double xPos = i.toDouble();

      for (var reg in listaDeRegistros) {
        if (reg.dataCriacao != null) {
          DateTime dataOriginal = reg.dataCriacao!;
          DateTime dataNormalizada =
              DateTime(dataOriginal.year, dataOriginal.month, dataOriginal.day);

          double yPos = dataNormalizada.millisecondsSinceEpoch.toDouble();
          spots.add(FlSpot(xPos, yPos));

          if (minDataY == null || yPos < minDataY) minDataY = yPos;
          if (maxDataY == null || yPos > maxDataY) maxDataY = yPos;
        }
      }
      spots.sort((a, b) => a.y.compareTo(b.y));

      if (spots.isNotEmpty) {
        linhasDoGrafico.add(
          LineChartBarData(
            spots: spots,
            isCurved: false,
            color: colorPalette[i % colorPalette.length],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
          ),
        );
      }
    }

    double minY = (minDataY ?? 0);
    double maxY = (maxDataY ?? 0);

    if (minY == maxY) {
      maxY += 86400000;
    }

    // --- CÁLCULO DE LARGURA ---
    double larguraPorSintoma = 70.0;
    double larguraTotalCalculada = sortedKeys.length * larguraPorSintoma;

    double larguraFinal =
        (widget.width != null && larguraTotalCalculada < widget.width!)
            ? widget.width!
            : larguraTotalCalculada;
    larguraFinal += 60;

    return Container(
      width: widget.width,
      height: widget.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: larguraFinal,
          height: widget.height,
          padding: EdgeInsets.fromLTRB(20, 50, 30, 20),
          child: LineChart(
            LineChartData(
              clipData: FlClipData.none(),
              lineTouchData: LineTouchData(
                handleBuiltInTouches: true,

                // --- A MÁGICA ACONTECE AQUI ---
                // Isso força o gráfico a calcular a distância exata até a bolinha (X e Y)
                // Agora você consegue selecionar bolinhas diferentes na mesma linha vertical.
                distanceCalculator: (touchPoint, spotPixelCoordinates) {
                  return (touchPoint - spotPixelCoordinates).distance;
                },

                // Aumentei um pouquinho o threshold (30) para facilitar o toque no celular
                // já que agora temos o distanceCalculator para garantir a precisão
                touchSpotThreshold: 30,

                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.blueGrey.shade800,
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  tooltipMargin: 8,
                  tooltipRoundedRadius: 8,
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    touchedSpots.sort((a, b) => a.x.compareTo(b.x));
                    return touchedSpots.map((spot) {
                      if (spot.barIndex >= sortedKeys.length) return null;
                      String nome = sortedKeys[spot.barIndex];
                      DateTime data =
                          DateTime.fromMillisecondsSinceEpoch(spot.y.toInt());
                      return LineTooltipItem(
                        "$nome\n${DateFormat('dd/MM').format(data)}",
                        const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      );
                    }).toList();
                  },
                ),
              ),
              titlesData: FlTitlesData(
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 86400000,
                    getTitlesWidget: (value, meta) {
                      DateTime date =
                          DateTime.fromMillisecondsSinceEpoch(value.toInt());
                      return Text(
                        DateFormat('dd/MM').format(date),
                        style: TextStyle(
                            fontSize: 10, color: Colors.grey.shade600),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 80,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      if (value % 1 != 0) {
                        return SizedBox.shrink();
                      }

                      int index = value.toInt();
                      if (index >= 0 && index < sortedKeys.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            width: 60,
                            child: Text(
                              sortedKeys[index],
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) =>
                    FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1),
                getDrawingVerticalLine: (value) =>
                    FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: linhasDoGrafico,
              minY: minY,
              maxY: maxY,
              minX: -0.5,
              maxX: sortedKeys.length.toDouble() - 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
