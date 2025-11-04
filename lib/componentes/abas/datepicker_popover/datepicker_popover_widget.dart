import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'datepicker_popover_model.dart';
export 'datepicker_popover_model.dart';

class DatepickerPopoverWidget extends StatefulWidget {
  const DatepickerPopoverWidget({
    super.key,
    this.dataInicial,
    this.dataselecionada,
  });

  final DateTime? dataInicial;
  final DateTime? dataselecionada;

  @override
  State<DatepickerPopoverWidget> createState() =>
      _DatepickerPopoverWidgetState();
}

class _DatepickerPopoverWidgetState extends State<DatepickerPopoverWidget> {
  late DatepickerPopoverModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatepickerPopoverModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0x4157636C),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              valueOrDefault<String>(
                widget.dataInicial != null
                    ? dateTimeFormat(
                        "d/M/y",
                        widget.dataInicial,
                        locale: FFLocalizations.of(context).languageCode,
                      )
                    : dateTimeFormat(
                        "d/M/y",
                        widget.dataselecionada,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                'Selecione data',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Icon(
                Icons.calendar_month,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
