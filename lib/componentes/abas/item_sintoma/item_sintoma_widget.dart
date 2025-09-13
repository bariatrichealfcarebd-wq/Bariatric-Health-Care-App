import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'item_sintoma_model.dart';
export 'item_sintoma_model.dart';

class ItemSintomaWidget extends StatefulWidget {
  const ItemSintomaWidget({
    super.key,
    required this.sintomaDoc,
  });

  final SintomasRecord? sintomaDoc;

  @override
  State<ItemSintomaWidget> createState() => _ItemSintomaWidgetState();
}

class _ItemSintomaWidgetState extends State<ItemSintomaWidget>
    with TickerProviderStateMixin {
  late ItemSintomaModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemSintomaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.vereficarIn = await queryLigacaoSintomaRecordOnce(
        queryBuilder: (ligacaoSintomaRecord) => ligacaoSintomaRecord
            .where(
              'id_sintoma',
              isEqualTo: widget.sintomaDoc?.reference.id,
            )
            .where(
              'cpf_usuario',
              isEqualTo: valueOrDefault(currentUserDocument?.cpf, ''),
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.vereficarIn?.reference != null) {
        _model.ativo = true;
        safeSetState(() {});
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          await animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      } else {
        _model.ativo = false;
        safeSetState(() {});
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          await animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .reverse();
        }
      }
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          _model.vereficar = await queryLigacaoSintomaRecordOnce(
            queryBuilder: (ligacaoSintomaRecord) => ligacaoSintomaRecord
                .where(
                  'id_sintoma',
                  isEqualTo: widget.sintomaDoc?.reference.id,
                )
                .where(
                  'cpf_usuario',
                  isEqualTo: valueOrDefault(currentUserDocument?.cpf, ''),
                ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          if (_model.vereficar?.reference != null) {
            _model.ativo = false;
            safeSetState(() {});
            if (animationsMap['containerOnActionTriggerAnimation'] != null) {
              await animationsMap['containerOnActionTriggerAnimation']!
                  .controller
                  .reverse();
            }
            await _model.vereficar!.reference.delete();
            FFAppState()
                .removeFromSintomasSelecionados(_model.vereficarIn!.reference);
            safeSetState(() {});
          } else {
            _model.ativo = true;
            safeSetState(() {});

            var ligacaoSintomaRecordReference =
                LigacaoSintomaRecord.collection.doc();
            await ligacaoSintomaRecordReference.set({
              ...createLigacaoSintomaRecordData(
                idSintoma: widget.sintomaDoc?.reference.id,
                cpfUsuario: valueOrDefault(currentUserDocument?.cpf, ''),
                nomeSintoma: widget.sintomaDoc?.nome,
              ),
              ...mapToFirestore(
                {
                  'id_nutriente': widget.sintomaDoc?.nutrientesAssociados
                      .map((e) => e.id)
                      .toList(),
                },
              ),
            });
            _model.docCriado = LigacaoSintomaRecord.getDocumentFromData({
              ...createLigacaoSintomaRecordData(
                idSintoma: widget.sintomaDoc?.reference.id,
                cpfUsuario: valueOrDefault(currentUserDocument?.cpf, ''),
                nomeSintoma: widget.sintomaDoc?.nome,
              ),
              ...mapToFirestore(
                {
                  'id_nutriente': widget.sintomaDoc?.nutrientesAssociados
                      .map((e) => e.id)
                      .toList(),
                },
              ),
            }, ligacaoSintomaRecordReference);
            FFAppState().addToSintomasSelecionados(_model.docCriado!.reference);
            safeSetState(() {});
            if (animationsMap['containerOnActionTriggerAnimation'] != null) {
              await animationsMap['containerOnActionTriggerAnimation']!
                  .controller
                  .forward(from: 0.0);
            }
          }

          safeSetState(() {});
        },
        child: Container(
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            color: Color(0xFFF1F4F8),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: _model.ativo
                  ? FlutterFlowTheme.of(context).secondary
                  : Color(0x00000000),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.sintomaDoc?.nome,
                            'nome',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF14181B),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.add_box,
                  color: Color(0xFF57636C),
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation']!,
      ),
    );
  }
}
