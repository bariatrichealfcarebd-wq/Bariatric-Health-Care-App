import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: subpágina da aplicação
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'historico_alimentao_model.dart';
export 'historico_alimentao_model.dart';

class HistoricoAlimentaoWidget extends StatefulWidget {
  const HistoricoAlimentaoWidget({super.key});

  static String routeName = 'HistoricoAlimentao';
  static String routePath = '/historicoAlimentao';

  @override
  State<HistoricoAlimentaoWidget> createState() =>
      _HistoricoAlimentaoWidgetState();
}

class _HistoricoAlimentaoWidgetState extends State<HistoricoAlimentaoWidget> {
  late HistoricoAlimentaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoricoAlimentaoModel());

    // Ação ao carregar a página.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserReference != null) {
        _model.temNet = await actions.checkInternet();
        if (_model.temNet == false) {
          FFAppState().isOffline = true;
          safeSetState(() {});
        } else {
          FFAppState().isOffline = false;
          safeSetState(() {});
        }
      } else {
        context.pushNamed(LoginWidget.routeName);

        return;
      }

      if ((valueOrDefault<bool>(currentUserDocument?.isADM, false) == true) ||
          (valueOrDefault<bool>(currentUserDocument?.admLess, false) == true)) {
        _model.pacienteData = await PacienteRecord.getDocumentOnce(
            FFAppState().pacientePesquisa!);
        _model.filtronutri = await queryRelatoriosPdfRecordOnce(
          queryBuilder: (relatoriosPdfRecord) => relatoriosPdfRecord.where(
            'user_cpf',
            isEqualTo: _model.pacienteData?.uid,
          ),
        );
        _model.listadePdfs = _model.filtronutri!
            .map((e) => e.reference)
            .toList()
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
      } else {
        _model.filtroteste2 = await queryRelatoriosPdfRecordOnce(
          queryBuilder: (relatoriosPdfRecord) => relatoriosPdfRecord.where(
            'user_cpf',
            isEqualTo: currentUserUid,
          ),
        );
        _model.listadePdfs = _model.filtroteste2!
            .map((e) => e.reference)
            .toList()
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar:
            (FFAppState().isOffline == false) || (currentUserReference != null)
                ? AppBar(
                    backgroundColor: Color(0xFFA7D2C7),
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    actions: [],
                    centerTitle: true,
                    elevation: 2.0,
                  )
                : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Visibility(
                          visible: currentUserReference != null,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gerenciar Documentos PDF',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF2D473F),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Faça upload de seus documentos médicos e baixe quando necessário:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF384E58),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              // Inicio
                                              final _datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    (_model.dataFiltrar ??
                                                        DateTime.now()),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .interTight(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (_datePicked1Date != null) {
                                                safeSetState(() {
                                                  _model.datePicked1 = DateTime(
                                                    _datePicked1Date.year,
                                                    _datePicked1Date.month,
                                                    _datePicked1Date.day,
                                                  );
                                                });
                                              } else if (_model.datePicked1 !=
                                                  null) {
                                                safeSetState(() {
                                                  _model.datePicked1 =
                                                      _model.dataFiltrar;
                                                });
                                              }
                                              _model.dataFiltrar =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "d/M",
                                                          _model.dataFiltrar,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        'Data inicio',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Icon(
                                                      Icons.calendar_month,
                                                      color: Colors.black,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              // Fim
                                              final _datePicked2Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: (_model.dataFim ??
                                                    DateTime.now()),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .interTight(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (_datePicked2Date != null) {
                                                safeSetState(() {
                                                  _model.datePicked2 = DateTime(
                                                    _datePicked2Date.year,
                                                    _datePicked2Date.month,
                                                    _datePicked2Date.day,
                                                  );
                                                });
                                              } else if (_model.datePicked2 !=
                                                  null) {
                                                safeSetState(() {
                                                  _model.datePicked2 =
                                                      _model.dataFim;
                                                });
                                              }
                                              _model.dataFim =
                                                  _model.datePicked2;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "d/M",
                                                          _model.dataFim,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        'Data fim',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Icon(
                                                      Icons.calendar_month,
                                                      color: Colors.black,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                            icon: Icon(
                                              Icons.check_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              if ((valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isADM,
                                                          false) ==
                                                      true) ||
                                                  (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.admLess,
                                                          false) ==
                                                      true)) {
                                                _model.filtroDataNutri =
                                                    await queryRelatoriosPdfRecordOnce(
                                                  queryBuilder:
                                                      (relatoriosPdfRecord) =>
                                                          relatoriosPdfRecord
                                                              .where(
                                                                'user_cpf',
                                                                isEqualTo: _model
                                                                    .pacienteData
                                                                    ?.uid,
                                                              )
                                                              .where(
                                                                'created_at',
                                                                isGreaterThanOrEqualTo:
                                                                    _model
                                                                        .dataFiltrar,
                                                              )
                                                              .where(
                                                                'created_at',
                                                                isLessThan:
                                                                    _model
                                                                        .dataFim,
                                                              ),
                                                );
                                                _model.listadePdfs = _model
                                                    .filtroDataNutri!
                                                    .map((e) => e.reference)
                                                    .toList()
                                                    .cast<DocumentReference>();
                                                safeSetState(() {});
                                              } else {
                                                _model.filtropacienteData =
                                                    await queryRelatoriosPdfRecordOnce(
                                                  queryBuilder:
                                                      (relatoriosPdfRecord) =>
                                                          relatoriosPdfRecord
                                                              .where(
                                                                'user_cpf',
                                                                isEqualTo:
                                                                    currentUserUid,
                                                              )
                                                              .where(
                                                                'created_at',
                                                                isGreaterThanOrEqualTo:
                                                                    _model
                                                                        .dataFiltrar,
                                                              )
                                                              .where(
                                                                'created_at',
                                                                isLessThan:
                                                                    _model
                                                                        .dataFim,
                                                              ),
                                                );
                                                _model.listadePdfs = _model
                                                    .filtropacienteData!
                                                    .map((e) => e.reference)
                                                    .toList()
                                                    .cast<DocumentReference>();
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F9FA),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0xFFE0E3E7),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Histórico de Documentos',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF2D473F),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final pdfItem = _model
                                                      .listadePdfs
                                                      .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: pdfItem.length,
                                                    itemBuilder: (context,
                                                        pdfItemIndex) {
                                                      final pdfItemItem =
                                                          pdfItem[pdfItemIndex];
                                                      return StreamBuilder<
                                                          RelatoriosPdfRecord>(
                                                        stream:
                                                            RelatoriosPdfRecord
                                                                .getDocument(
                                                                    pdfItemItem),
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

                                                          final containerRelatoriosPdfRecord =
                                                              snapshot.data!;

                                                          return Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Flex(
                                                                        direction:
                                                                            Axis.vertical,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.picture_as_pdf_rounded,
                                                                                  color: Color(0xFFFF5963),
                                                                                  size: 24.0,
                                                                                ),
                                                                                Container(
                                                                                  width: 170.0,
                                                                                  height: 24.0,
                                                                                  child: custom_widgets.MarqueeText(
                                                                                    width: 170.0,
                                                                                    height: 24.0,
                                                                                    text: '${containerRelatoriosPdfRecord.nomeDoArquivo}',
                                                                                    textColor: Colors.black,
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .download_sharp,
                                                                        color: Color(
                                                                            0xFF4B986C),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Fazer o download?'),
                                                                                  content: Text('Tem a certeza de que pretende baixar este documento?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Não'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Sim'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          await launchURL(
                                                                              containerRelatoriosPdfRecord.pdfUrl);
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      },
                                                                    ),
                                                                    if (valueOrDefault<bool>(
                                                                            currentUserDocument?.isADM,
                                                                            false) ==
                                                                        true)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
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
                                                                                await containerRelatoriosPdfRecord.reference.delete();
                                                                                if ((valueOrDefault<bool>(currentUserDocument?.isADM, false) == true) || (valueOrDefault<bool>(currentUserDocument?.admLess, false) == true)) {
                                                                                  _model.filtronutri3 = await queryRelatoriosPdfRecordOnce(
                                                                                    queryBuilder: (relatoriosPdfRecord) => relatoriosPdfRecord.where(
                                                                                      'user_cpf',
                                                                                      isEqualTo: _model.pacienteData?.uid,
                                                                                    ),
                                                                                  );
                                                                                  _model.listadePdfs = _model.filtronutri!.map((e) => e.reference).toList().cast<DocumentReference>();
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  _model.filtroteste3 = await queryRelatoriosPdfRecordOnce(
                                                                                    queryBuilder: (relatoriosPdfRecord) => relatoriosPdfRecord.where(
                                                                                      'user_cpf',
                                                                                      isEqualTo: currentUserUid,
                                                                                    ),
                                                                                  );
                                                                                  _model.listadePdfs = _model.filtroteste2!.map((e) => e.reference).toList().cast<DocumentReference>();
                                                                                  safeSetState(() {});
                                                                                }
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.delete_forever,
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (FFAppState().isOffline == true)
                wrapWithModel(
                  model: _model.noInternetPopuPModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NoInternetPopuPWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
