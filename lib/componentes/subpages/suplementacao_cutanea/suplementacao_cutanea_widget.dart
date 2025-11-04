import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/componentes/abas/calendario_pop/calendario_pop_widget.dart';
import '/componentes/abas/datepicker_popover/datepicker_popover_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'suplementacao_cutanea_model.dart';
export 'suplementacao_cutanea_model.dart';

class SuplementacaoCutaneaWidget extends StatefulWidget {
  const SuplementacaoCutaneaWidget({super.key});

  static String routeName = 'SuplementacaoCutanea';
  static String routePath = '/suplementacaoCutanea';

  @override
  State<SuplementacaoCutaneaWidget> createState() =>
      _SuplementacaoCutaneaWidgetState();
}

class _SuplementacaoCutaneaWidgetState
    extends State<SuplementacaoCutaneaWidget> {
  late SuplementacaoCutaneaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuplementacaoCutaneaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((valueOrDefault<bool>(currentUserDocument?.isADM, false) == true) ||
          (valueOrDefault<bool>(currentUserDocument?.admLess, false) == true)) {
        _model.pacienteData = await PacienteRecord.getDocumentOnce(
            FFAppState().pacientePesquisa!);
        _model.filtrodanutri = await querySuplementacaoRecordOnce(
          queryBuilder: (suplementacaoRecord) => suplementacaoRecord
              .where(
                'id_User',
                isEqualTo: _model.pacienteData?.uid,
              )
              .orderBy('create_day', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      } else {
        _model.filtrodapaciente = await querySuplementacaoRecordOnce(
          queryBuilder: (suplementacaoRecord) => suplementacaoRecord
              .where(
                'id_User',
                isEqualTo: currentUserUid,
              )
              .orderBy('create_day', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      }

      _model.supatual =
          (valueOrDefault<bool>(currentUserDocument?.isADM, false) == true) ||
                  (valueOrDefault<bool>(currentUserDocument?.admLess, false) ==
                      true)
              ? _model.filtrodanutri
              : _model.filtrodapaciente;
      safeSetState(() {});
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
        appBar: AppBar(
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
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 610.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 32.0, 8.0, 8.0),
                                child: Text(
                                  'Suplementação Cutânea',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 1.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 47.0, 0.0, 0.0),
                                child: Text(
                                  'Data da medicação:',
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .displayMedium
                                                  .fontWeight,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontWeight,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 8.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      if ((valueOrDefault<bool>(
                                                  currentUserDocument?.isADM,
                                                  false) ==
                                              true) ||
                                          (valueOrDefault<bool>(
                                                  currentUserDocument?.admLess,
                                                  false) ==
                                              true)) {
                                        _model.supatual = null;
                                        safeSetState(() {});
                                        await showAlignedDialog(
                                          barrierColor: Colors.transparent,
                                          context: context,
                                          isGlobal: false,
                                          avoidOverflow: false,
                                          targetAnchor: AlignmentDirectional(
                                                  0.0, -1.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: AlignmentDirectional(
                                                  0.0, 1.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Container(
                                                  width: 330.0,
                                                  child: CalendarioPopWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.selectedDate = value));

                                        _shouldSetState = true;
                                        _model.dataSelecionada =
                                            _model.selectedDate;
                                        safeSetState(() {});
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.datepickerPopoverModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: DatepickerPopoverWidget(
                                        dataInicial: _model.supatual?.data,
                                        dataselecionada: _model.selectedDate,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 47.0, 0.0, 0.0),
                                    child: Text(
                                      'Anexo:',
                                      style: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMedium
                                                      .fontWeight,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .displayMedium
                                                    .fontWeight,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 409.8,
                                    height: 93.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (_model.ficheiroCarregado != null &&
                                            (_model.ficheiroCarregado?.bytes
                                                    ?.isNotEmpty ??
                                                false))
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Novo arquivo anexado',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if ((valueOrDefault<bool>(
                                                                currentUserDocument
                                                                    ?.isADM,
                                                                false) ==
                                                            false) ||
                                                        (valueOrDefault<bool>(
                                                                currentUserDocument
                                                                    ?.admLess,
                                                                false) ==
                                                            false))
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.ficheiroCarregado =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.delete_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        if ((_model.supatual != null) &&
                                            (_model.ficheiroCarregado == null ||
                                                (_model.ficheiroCarregado?.bytes
                                                        ?.isEmpty ??
                                                    true)))
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Arquivo anexado',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await launchURL(_model
                                                            .supatual!.anexo);
                                                      },
                                                      child: Icon(
                                                        Icons.download_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if ((valueOrDefault<bool>(
                                              currentUserDocument?.isADM,
                                              false) ==
                                          true) ||
                                      (valueOrDefault<bool>(
                                              currentUserDocument?.admLess,
                                              false) ==
                                          true))
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 48.6,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .success,
                                        icon: Icon(
                                          Icons.cloud_upload,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          final selectedFiles =
                                              await selectFiles(
                                            allowedExtensions: ['pdf'],
                                            multiFile: false,
                                          );
                                          if (selectedFiles != null) {
                                            safeSetState(() => _model
                                                    .isDataUploading_uploadDataLd3 =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedFiles
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                              ))
                                                      .toList();
                                            } finally {
                                              _model.isDataUploading_uploadDataLd3 =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedFiles.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadDataLd3 =
                                                    selectedUploadedFiles.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          _model.ficheiroCarregado = _model
                                              .uploadedLocalFile_uploadDataLd3;
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if ((valueOrDefault<bool>(
                                          currentUserDocument?.isADM, false) ==
                                      true) ||
                                  (valueOrDefault<bool>(
                                          currentUserDocument?.admLess,
                                          false) ==
                                      true))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 24.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => FFButtonWidget(
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
                                            {
                                              safeSetState(() => _model
                                                      .isDataUploading_uploadDataP6v =
                                                  true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];
                                              var selectedFiles =
                                                  <SelectedFile>[];
                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles = _model
                                                        .ficheiroCarregado!
                                                        .bytes!
                                                        .isNotEmpty
                                                    ? [
                                                        _model
                                                            .ficheiroCarregado!
                                                      ]
                                                    : <FFUploadedFile>[];
                                                selectedFiles =
                                                    selectedFilesFromUploadedFiles(
                                                  selectedUploadedFiles,
                                                );
                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedFiles.map(
                                                    (f) async =>
                                                        await uploadData(
                                                            f.storagePath,
                                                            f.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading_uploadDataP6v =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedFiles.length &&
                                                  downloadUrls.length ==
                                                      selectedFiles.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_uploadDataP6v =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl_uploadDataP6v =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }

                                            await NutriPacienteRecord.collection
                                                .doc()
                                                .set(
                                                    createNutriPacienteRecordData(
                                                  uidPaciente: _model
                                                      .uploadedLocalFile_uploadDataLd3
                                                      .height
                                                      ?.toString(),
                                                ));

                                            await SuplementacaoRecord.collection
                                                .doc()
                                                .set(
                                                    createSuplementacaoRecordData(
                                                  idUser:
                                                      _model.pacienteData?.uid,
                                                  data: _model.dataSelecionada,
                                                  anexo: _model
                                                      .uploadedFileUrl_uploadDataP6v,
                                                  createDay:
                                                      getCurrentTimestamp,
                                                ));
                                          }
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Adicionado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          safeSetState(() {});
                                        },
                                        text: 'Salvar',
                                        options: FFButtonOptions(
                                          width: 900.0,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF249689),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
