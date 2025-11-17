import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'graf_ico_peso_model.dart';
export 'graf_ico_peso_model.dart';

/// Pagina para exibir o peso do paciente
///
class GrafIcoPesoWidget extends StatefulWidget {
  const GrafIcoPesoWidget({super.key});

  static String routeName = 'GrafIcoPeso';
  static String routePath = '/grafIcoPeso';

  @override
  State<GrafIcoPesoWidget> createState() => _GrafIcoPesoWidgetState();
}

class _GrafIcoPesoWidgetState extends State<GrafIcoPesoWidget> {
  late GrafIcoPesoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrafIcoPesoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((valueOrDefault<bool>(currentUserDocument?.isADM, false) == true) ||
          (valueOrDefault<bool>(currentUserDocument?.admLess, false) == true)) {
        _model.pacienteData = await PacienteRecord.getDocumentOnce(
            FFAppState().pacientePesquisa!);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).success,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Grafico Paciente',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FontStyle.italic,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 750.0,
                decoration: BoxDecoration(
                  color: Color(0x6857636C),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) {
                        if ((valueOrDefault<bool>(
                                    currentUserDocument?.isADM, false) ==
                                true) ||
                            (valueOrDefault<bool>(
                                    currentUserDocument?.admLess, false) ==
                                true)) {
                          return StreamBuilder<List<PacientePesoRecord>>(
                            stream: queryPacientePesoRecord(
                              queryBuilder: (pacientePesoRecord) =>
                                  pacientePesoRecord.where(
                                'uid_Paciente',
                                isEqualTo: _model.pacienteData?.uid,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<PacientePesoRecord>
                                  chartPacientePesoRecordList = snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 530.0,
                                child: FlutterFlowLineChart(
                                  data: [
                                    FFLineChartData(
                                      xData: chartPacientePesoRecordList
                                          .map((e) => e.peso)
                                          .toList(),
                                      yData: chartPacientePesoRecordList
                                          .map((e) => e.dataRegistro)
                                          .withoutNulls
                                          .toList(),
                                      settings: LineChartBarData(
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        barWidth: 2.0,
                                        isCurved: true,
                                        dotData: FlDotData(show: false),
                                        belowBarData: BarAreaData(
                                          show: true,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                        ),
                                      ),
                                    )
                                  ],
                                  chartStylingInfo: ChartStylingInfo(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    showGrid: true,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    borderWidth: 1.0,
                                  ),
                                  axisBounds: AxisBounds(),
                                  xAxisLabelInfo: AxisLabelInfo(
                                    title: 'Data/ano',
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    reservedSize: 32.0,
                                  ),
                                  yAxisLabelInfo: AxisLabelInfo(
                                    title: 'Peso',
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    showLabels: true,
                                    labelInterval: 10.0,
                                    labelFormatter: LabelFormatter(
                                      numberFormat: (val) => formatNumber(
                                        val,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                    ),
                                    reservedSize: 20.0,
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return StreamBuilder<List<PacientePesoRecord>>(
                            stream: queryPacientePesoRecord(
                              queryBuilder: (pacientePesoRecord) =>
                                  pacientePesoRecord.where(
                                'uid_Paciente',
                                isEqualTo: currentUserUid,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<PacientePesoRecord>
                                  chartPacientePesoRecordList = snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 530.0,
                                child: FlutterFlowLineChart(
                                  data: [
                                    FFLineChartData(
                                      xData: chartPacientePesoRecordList
                                          .map((e) => e.peso)
                                          .toList(),
                                      yData: chartPacientePesoRecordList
                                          .map((e) => e.dataRegistro)
                                          .withoutNulls
                                          .toList(),
                                      settings: LineChartBarData(
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        barWidth: 2.0,
                                        isCurved: true,
                                        dotData: FlDotData(show: false),
                                        belowBarData: BarAreaData(
                                          show: true,
                                          color: Color(0x4CEFA639),
                                        ),
                                      ),
                                    )
                                  ],
                                  chartStylingInfo: ChartStylingInfo(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    showGrid: true,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    borderWidth: 1.0,
                                  ),
                                  axisBounds: AxisBounds(),
                                  xAxisLabelInfo: AxisLabelInfo(
                                    title: 'Data/ Ano',
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    reservedSize: 32.0,
                                  ),
                                  yAxisLabelInfo: AxisLabelInfo(
                                    title: 'Peso',
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    showLabels: true,
                                    labelInterval: 10.0,
                                    labelFormatter: LabelFormatter(
                                      numberFormat: (val) => formatNumber(
                                        val,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                    ),
                                    reservedSize: 25.0,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
