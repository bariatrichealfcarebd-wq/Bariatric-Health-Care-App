import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'historico_sup_model.dart';
export 'historico_sup_model.dart';

/// criar pagina de historico de suplementacao divida em cuatena outras e
/// diarios
///
class HistoricoSupWidget extends StatefulWidget {
  const HistoricoSupWidget({super.key});

  static String routeName = 'HistoricoSup';
  static String routePath = '/historicoSup';

  @override
  State<HistoricoSupWidget> createState() => _HistoricoSupWidgetState();
}

class _HistoricoSupWidgetState extends State<HistoricoSupWidget>
    with TickerProviderStateMixin {
  late HistoricoSupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoricoSupModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((valueOrDefault<bool>(currentUserDocument?.isADM, false) == true) ||
          (valueOrDefault<bool>(currentUserDocument?.admLess, false) == true)) {
        _model.pacienteDat = await PacienteRecord.getDocumentOnce(
            FFAppState().pacientePesquisa!);
        _model.filtroNuti = await querySuplementacaodiariaRecordOnce(
          queryBuilder: (suplementacaodiariaRecord) =>
              suplementacaodiariaRecord.where(
            'id_User',
            isEqualTo: _model.pacienteDat?.uid,
          ),
        );
        _model.listaSupDiaria = _model.filtroNuti!
            .map((e) => e.reference)
            .toList()
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
      } else {
        _model.filtroPaciente = await querySuplementacaodiariaRecordOnce(
          queryBuilder: (suplementacaodiariaRecord) =>
              suplementacaodiariaRecord.where(
            'id_User',
            isEqualTo: currentUserUid,
          ),
        );
        _model.listaSupDiaria = _model.filtroPaciente!
            .map((e) => e.reference)
            .toList()
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              Text(
                'Histórico de Suplementação',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).secondary,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    unselectedLabelStyle: TextStyle(),
                    indicatorColor: FlutterFlowTheme.of(context).secondary,
                    indicatorWeight: 3.0,
                    tabs: [
                      Tab(
                        text: 'Diários',
                      ),
                      Tab(
                        text: 'Cutânea',
                      ),
                      Tab(
                        text: 'Outros',
                      ),
                    ],
                    controller: _model.tabBarController,
                    onTap: (i) async {
                      [
                        () async {
                          if ((valueOrDefault<bool>(
                                      currentUserDocument?.isADM, false) ==
                                  true) ||
                              (valueOrDefault<bool>(
                                      currentUserDocument?.admLess, false) ==
                                  true)) {
                            _model.filtroNutriDiario =
                                await querySuplementacaodiariaRecordOnce(
                              queryBuilder: (suplementacaodiariaRecord) =>
                                  suplementacaodiariaRecord.where(
                                'id_User',
                                isEqualTo: _model.pacienteDat?.uid,
                              ),
                            );
                            _model.listaSupDiaria = _model.filtroNutriDiario!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          } else {
                            _model.filtroPacienteDiario =
                                await querySuplementacaodiariaRecordOnce(
                              queryBuilder: (suplementacaodiariaRecord) =>
                                  suplementacaodiariaRecord.where(
                                'id_User',
                                isEqualTo: currentUserUid,
                              ),
                            );
                            _model.listaSupDiaria = _model.filtroPacienteDiario!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                        () async {
                          if ((valueOrDefault<bool>(
                                      currentUserDocument?.isADM, false) ==
                                  true) ||
                              (valueOrDefault<bool>(
                                      currentUserDocument?.admLess, false) ==
                                  true)) {
                            _model.filtroNutriCutanea =
                                await querySuplementacaoRecordOnce(
                              queryBuilder: (suplementacaoRecord) =>
                                  suplementacaoRecord.where(
                                'id_User',
                                isEqualTo: _model.pacienteDat?.uid,
                              ),
                            );
                            _model.listaSupCutanea = _model.filtroNutriCutanea!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          } else {
                            _model.filtroPacienteCutanea =
                                await querySuplementacaoRecordOnce(
                              queryBuilder: (suplementacaoRecord) =>
                                  suplementacaoRecord.where(
                                'id_User',
                                isEqualTo: currentUserUid,
                              ),
                            );
                            _model.listaSupCutanea = _model
                                .filtroPacienteCutanea!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                        () async {
                          if ((valueOrDefault<bool>(
                                      currentUserDocument?.isADM, false) ==
                                  true) ||
                              (valueOrDefault<bool>(
                                      currentUserDocument?.admLess, false) ==
                                  true)) {
                            _model.filtroNutriOutras =
                                await queryOutrasSuplementacaoRecordOnce(
                              queryBuilder: (outrasSuplementacaoRecord) =>
                                  outrasSuplementacaoRecord.where(
                                'id_User',
                                isEqualTo: _model.pacienteDat?.uid,
                              ),
                            );
                            _model.listaSupOutros = _model.filtroNutriOutras!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          } else {
                            _model.filtroPacienteOutras =
                                await queryOutrasSuplementacaoRecordOnce(
                              queryBuilder: (outrasSuplementacaoRecord) =>
                                  outrasSuplementacaoRecord.where(
                                'id_User',
                                isEqualTo: currentUserUid,
                              ),
                            );
                            _model.listaSupOutros = _model.filtroPacienteOutras!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        }
                      ][i]();
                    },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _model.tabBarController,
                    children: [
                      KeepAliveWidgetWrapper(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final supDiariaItem =
                                        _model.listaSupDiaria.toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(supDiariaItem.length,
                                              (supDiariaItemIndex) {
                                        final supDiariaItemItem =
                                            supDiariaItem[supDiariaItemIndex];
                                        return StreamBuilder<
                                            SuplementacaodiariaRecord>(
                                          stream: SuplementacaodiariaRecord
                                              .getDocument(supDiariaItemItem),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final rowSuplementacaodiariaRecord =
                                                snapshot.data!;

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 337.0,
                                                          height: 49.4,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                rowSuplementacaodiariaRecord
                                                                    .tipoSuplementacao,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderRadius:
                                                                          8.0,
                                                                      fillColor:
                                                                          Color(
                                                                              0xFF78C3BA),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .download_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        await launchURL(
                                                                            rowSuplementacaodiariaRecord.anexo);
                                                                      },
                                                                    ),
                                                                  ),
                                                                  if (valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.isADM,
                                                                          false) ==
                                                                      true)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: Text('Apagar?'),
                                                                                      content: Text('Quer mesmo continuar'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                          child: Text('não'),
                                                                                        ),
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                          child: Text('sim'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              await rowSuplementacaodiariaRecord.reference.delete();
                                                                              _model.fi = await querySuplementacaodiariaRecordOnce(
                                                                                queryBuilder: (suplementacaodiariaRecord) => suplementacaodiariaRecord.where(
                                                                                  'id_User',
                                                                                  isEqualTo: _model.pacienteDat?.uid,
                                                                                ),
                                                                              );
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.delete_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 12.0)),
                                            );
                                          },
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ],
                        ),
                      ),
                      KeepAliveWidgetWrapper(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final cutaneaListItem =
                                        _model.listaSupCutanea.toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(cutaneaListItem.length,
                                              (cutaneaListItemIndex) {
                                        final cutaneaListItemItem =
                                            cutaneaListItem[
                                                cutaneaListItemIndex];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 337.0,
                                                      height: 49.4,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: StreamBuilder<
                                                          SuplementacaoRecord>(
                                                        stream: SuplementacaoRecord
                                                            .getDocument(
                                                                cutaneaListItemItem),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final rowSuplementacaoRecord =
                                                              snapshot.data!;

                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        "d/M",
                                                                        rowSuplementacaoRecord
                                                                            .data!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        150.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  fillColor: Color(
                                                                      0xFF78C3BA),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .download_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await launchURL(
                                                                        rowSuplementacaoRecord
                                                                            .anexo);
                                                                  },
                                                                ),
                                                              ),
                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isADM,
                                                                      false) ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Apagar?'),
                                                                                  content: Text('Quer mesmo continuar'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('não'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('sim'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          await cutaneaListItemItem
                                                                              .delete();
                                                                          _model.fiCopy =
                                                                              await querySuplementacaoRecordOnce(
                                                                            queryBuilder: (suplementacaoRecord) =>
                                                                                suplementacaoRecord.where(
                                                                              'id_User',
                                                                              isEqualTo: _model.pacienteDat?.uid,
                                                                            ),
                                                                          );
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .delete_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ],
                        ),
                      ),
                      KeepAliveWidgetWrapper(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final outrosSupItens =
                                    _model.listaSupOutros.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: outrosSupItens.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 10.0),
                                  itemBuilder: (context, outrosSupItensIndex) {
                                    final outrosSupItensItem =
                                        outrosSupItens[outrosSupItensIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 337.0,
                                                  height: 67.9,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: StreamBuilder<
                                                      OutrasSuplementacaoRecord>(
                                                    stream: OutrasSuplementacaoRecord
                                                        .getDocument(
                                                            outrosSupItensItem),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      final rowOutrasSuplementacaoRecord =
                                                          snapshot.data!;

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  rowOutrasSuplementacaoRecord
                                                                      .nome,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                    "d/M/y",
                                                                    rowOutrasSuplementacaoRecord
                                                                        .dataMedic!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  fillColor: Color(
                                                                      0xFF78C3BA),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .download_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await launchURL(
                                                                        rowOutrasSuplementacaoRecord
                                                                            .anexo);
                                                                  },
                                                                ),
                                                              ),
                                                              if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isADM,
                                                                      false) ==
                                                                  true)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Apagar?'),
                                                                                    content: Text('Quer mesmo continuar'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('não'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('sim'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                          if (confirmDialogResponse) {
                                                                            await rowOutrasSuplementacaoRecord.reference.delete();
                                                                            _model.fiCopy2 =
                                                                                await queryOutrasSuplementacaoRecordOnce(
                                                                              queryBuilder: (outrasSuplementacaoRecord) => outrasSuplementacaoRecord.where(
                                                                                'id_User',
                                                                                isEqualTo: _model.pacienteDat?.uid,
                                                                              ),
                                                                            );
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .delete_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              23.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
