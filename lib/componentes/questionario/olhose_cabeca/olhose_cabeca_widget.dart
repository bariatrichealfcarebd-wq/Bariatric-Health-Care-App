import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/abas/item_sintoma/item_sintoma_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: questionário
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'olhose_cabeca_model.dart';
export 'olhose_cabeca_model.dart';

class OlhoseCabecaWidget extends StatefulWidget {
  const OlhoseCabecaWidget({super.key});

  @override
  State<OlhoseCabecaWidget> createState() => _OlhoseCabecaWidgetState();
}

class _OlhoseCabecaWidgetState extends State<OlhoseCabecaWidget>
    with TickerProviderStateMixin {
  late OlhoseCabecaModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OlhoseCabecaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.sintomasDoUsuario = await queryLigacaoSintomaRecordOnce(
        queryBuilder: (ligacaoSintomaRecord) => ligacaoSintomaRecord.where(
          'cpf_usuario',
          isEqualTo: valueOrDefault(currentUserDocument?.cpf, ''),
        ),
      );
      for (int loop1Index = 0;
          loop1Index < _model.sintomasDoUsuario!.length;
          loop1Index++) {
        final currentLoop1Item = _model.sintomasDoUsuario![loop1Index];
        FFAppState().addToSintomasSelecionados(currentLoop1Item.reference);
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'itemSintomaOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.95, 0.95),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 32.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x2F1D2429),
              offset: Offset(
                0.0,
                3.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ),
                          Text(
                            'Olhos e cabeça',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF14181B),
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Selecione apenas os sinais e sintomas manifestados:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: StreamBuilder<List<SintomasRecord>>(
                                  stream: querySintomasRecord(
                                    queryBuilder: (sintomasRecord) =>
                                        sintomasRecord.where(
                                      'categoria',
                                      arrayContains: 'olhos e cabeça',
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<SintomasRecord>
                                        listViewSintomasRecordList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewSintomasRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewSintomasRecord =
                                            listViewSintomasRecordList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model:
                                              _model.itemSintomaModels.getModel(
                                            listViewSintomasRecord.reference.id,
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemSintomaWidget(
                                            key: Key(
                                              'Keylp2_${listViewSintomasRecord.reference.id}',
                                            ),
                                            sintomaDoc: listViewSintomasRecord,
                                          ),
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'itemSintomaOnActionTriggerAnimation']!,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
