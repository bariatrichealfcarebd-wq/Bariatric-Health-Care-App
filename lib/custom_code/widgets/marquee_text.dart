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

// Import necessário para o widget de animação
import 'package:marquee/marquee.dart';

class MarqueeText extends StatefulWidget {
  const MarqueeText({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    this.textColor, // Novo parâmetro de cor, opcional
  }) : super(key: key);

  final double width;
  final double height;
  final String text;
  final Color? textColor; // Novo parâmetro de cor

  @override
  _MarqueeTextState createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Marquee(
        text: widget.text,
        // Lógica para usar a cor passada ou a cor padrão do tema
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color:
                  widget.textColor ?? FlutterFlowTheme.of(context).primaryText,
            ),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 20.0,
        velocity: 50.0,
        pauseAfterRound: Duration(seconds: 2),
        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}
