import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tipodesuplementodiario_model.dart';
export 'tipodesuplementodiario_model.dart';

class TipodesuplementodiarioWidget extends StatefulWidget {
  const TipodesuplementodiarioWidget({super.key});

  static String routeName = 'Tipodesuplementodiario';
  static String routePath = '/tipodesuplementodiario';

  @override
  State<TipodesuplementodiarioWidget> createState() =>
      _TipodesuplementodiarioWidgetState();
}

class _TipodesuplementodiarioWidgetState
    extends State<TipodesuplementodiarioWidget> {
  late TipodesuplementodiarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TipodesuplementodiarioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((valueOrDefault<bool>(currentUserDocument?.isADM, false) == true) ||
          (valueOrDefault<bool>(currentUserDocument?.admLess, false) == true)) {
        _model.pacienteData = await PacienteRecord.getDocumentOnce(
            FFAppState().pacientePesquisa!);
        _model.filtronutri = await querySuplementacaodiariaRecordOnce(
          queryBuilder: (suplementacaodiariaRecord) => suplementacaodiariaRecord
              .where(
                'id_User',
                isEqualTo: _model.pacienteData?.uid,
              )
              .orderBy('creat_day', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      } else {
        _model.filtropaciente = await querySuplementacaodiariaRecordOnce(
          queryBuilder: (suplementacaodiariaRecord) => suplementacaodiariaRecord
              .where(
                'id_User',
                isEqualTo: currentUserUid,
              )
              .orderBy('creat_day', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      }

      _model.supdiaria =
          (valueOrDefault<bool>(currentUserDocument?.isADM, false) == true) ||
                  (valueOrDefault<bool>(currentUserDocument?.admLess, false) ==
                      true)
              ? _model.filtronutri
              : _model.filtropaciente;
      safeSetState(() {});
    });

    _model.tipoDeSuplementoTextController ??= TextEditingController();

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
                                  'Suplementação Diaria',
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
                                    8.0, 52.0, 0.0, 0.0),
                                child: Text(
                                  'Tipo de suplemento:',
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 18.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 200.0,
                                      child: Autocomplete<String>(
                                        initialValue: TextEditingValue(),
                                        optionsBuilder: (textEditingValue) {
                                          if (textEditingValue.text == '') {
                                            return const Iterable<
                                                String>.empty();
                                          }
                                          return ['Option 1'].where((option) {
                                            final lowercaseOption =
                                                option.toLowerCase();
                                            return lowercaseOption.contains(
                                                textEditingValue.text
                                                    .toLowerCase());
                                          });
                                        },
                                        optionsViewBuilder:
                                            (context, onSelected, options) {
                                          return AutocompleteOptionsList(
                                            textFieldKey:
                                                _model.tipoDeSuplementoKey,
                                            textController: _model
                                                .tipoDeSuplementoTextController!,
                                            options: options.toList(),
                                            onSelected: onSelected,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            textHighlightStyle: TextStyle(),
                                            elevation: 4.0,
                                            optionBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            optionHighlightColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            maxHeight: 200.0,
                                          );
                                        },
                                        onSelected: (String selection) {
                                          safeSetState(() => _model
                                                  .tipoDeSuplementoSelectedOption =
                                              selection);
                                          FocusScope.of(context).unfocus();
                                        },
                                        fieldViewBuilder: (
                                          context,
                                          textEditingController,
                                          focusNode,
                                          onEditingComplete,
                                        ) {
                                          _model.tipoDeSuplementoFocusNode =
                                              focusNode;

                                          _model.tipoDeSuplementoTextController =
                                              textEditingController;
                                          return TextFormField(
                                            key: _model.tipoDeSuplementoKey,
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            onEditingComplete:
                                                onEditingComplete,
                                            autofocus: false,
                                            readOnly: (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isADM,
                                                        false) ==
                                                    false) &&
                                                (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.admLess,
                                                        false) ==
                                                    false),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              hintText: _model
                                                  .supdiaria?.tipoSuplementacao,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: Color(0x4157636C),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            textAlign: TextAlign.start,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .tipoDeSuplementoTextControllerValidator
                                                .asValidator(context),
                                          );
                                        },
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
                                        if ((_model.supdiaria != null) &&
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
                                                            .supdiaria!.anexo);
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
                                                    .isDataUploading_uploadDataLd4 =
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
                                                                originalFilename:
                                                                    m.originalFilename,
                                                              ))
                                                      .toList();
                                            } finally {
                                              _model.isDataUploading_uploadDataLd4 =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedFiles.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadDataLd4 =
                                                    selectedUploadedFiles.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          _model.ficheiroCarregado = _model
                                              .uploadedLocalFile_uploadDataLd4;
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
                                          if (currentUserReference != null) {
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
                                                        .isDataUploading_uploadData0zh =
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
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading_uploadData0zh =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedFiles.length &&
                                                    downloadUrls.length ==
                                                        selectedFiles.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile_uploadData0zh =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl_uploadData0zh =
                                                        downloadUrls.first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }

                                              await SuplementacaodiariaRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createSuplementacaodiariaRecordData(
                                                    tipoSuplementacao: _model
                                                        .tipoDeSuplementoTextController
                                                        .text,
                                                    idUser: _model
                                                        .pacienteData?.uid,
                                                    anexo: _model
                                                        .uploadedFileUrl_uploadData0zh,
                                                    creatDay:
                                                        getCurrentTimestamp,
                                                  ));

                                              await NutriPacienteRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createNutriPacienteRecordData(
                                                    uidPaciente: _model
                                                        .uploadedLocalFile_uploadDataLd4
                                                        .height
                                                        ?.toString(),
                                                  ));
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Paciente não selecionado '),
                                                  content: Text(
                                                      'Selecione um paciente'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
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
