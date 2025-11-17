import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'termopopup_model.dart';
export 'termopopup_model.dart';

class TermopopupWidget extends StatefulWidget {
  const TermopopupWidget({super.key});

  @override
  State<TermopopupWidget> createState() => _TermopopupWidgetState();
}

class _TermopopupWidgetState extends State<TermopopupWidget> {
  late TermopopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermopopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100.0,
            height: 557.79,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Termos e condições',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: 349.79,
                  height: 456.5,
                  decoration: BoxDecoration(
                    color: Color(0xFF249689),
                    borderRadius: BorderRadius.circular(12.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Este documento estabelece os Termos de Uso e a Política de Privacidade do aplicativo Bariatric Health Care, desenvolvido por Matheus Mencinauski de Sousa e Luiz Gustavo Rocha Gomes, em Mogi das Cruzes, São Paulo, Brasil.\nAo utilizar o Bariatric Health Care, você concorda integralmente com estes seguintes termos:\n \n1. Coleta de Dados Pessoais\nBariatric Health Care coleta dados pessoais para as funcionalidades internas do aplicativo. Os tipos de dados coletados podem incluir, mas não se limitar a:\n•\tDados de Cadastro: Nome completo, e-mail, número de telefone, data de nascimento, CPF.\n•\tDados de Uso: Informações sobre como você interage com o aplicativo, como telas acessadas, recursos utilizados, duração da sessão etc.\n•\tDados de Dispositivo: Tipo de dispositivo, sistema operacional, identificadores de dispositivo, endereço IP.\n\n2. Finalidade da Coleta e Tratamento dos Dados\nOs dados pessoais coletados são utilizados para as seguintes finalidades:\n•\tFornecer e personalizar os serviços do aplicativo.\n•\tMelhorar e otimizar a funcionalidade do aplicativo.\n•\tComunicar informações importantes para o profissional da nutrição.\n•\tRealizar análises estatísticas e de desempenho.\n•\tCumprir obrigações legais e regulatórias.\n\n3. Compartilhamento de Dados\nBariatric Health Care não compartilha seus dados pessoais com terceiros, exceto nas seguintes situações:\n•\tQuando exigido por lei ou ordem judicial.\n•\tCom sua autorização expressa.\n\n4. Armazenamento e Segurança dos Dados\nOs dados pessoais coletados são armazenados em servidores seguros, localizados em localidades regionais do serviço Firebasen, pertencente a Google. Empregamos medidas de segurança técnicas e administrativas para proteger seus dados contra acesso não autorizado, uso indevido, divulgação, alteração ou destruição.\n\n5. Direitos do Titular dos Dados (LGPD)\nDe acordo com a Lei Geral de Proteção de Dados (LGPD), você, como titular dos dados, possui os seguintes direitos:\n•\tConfirmação e Acesso: Obter a confirmação da existência de tratamento e o acesso aos seus dados pessoais.\n•\tCorreção: Solicitar a correção de dados incompletos, inexatos ou desatualizados.\n•\tAnonimização, Bloqueio ou Eliminação: Requerer a anonimização, bloqueio ou eliminação de dados desnecessários, excessivos ou tratados em desconformidade com a LGPD.\n•\tPortabilidade: Receber os dados pessoais que lhe digam respeito e transmiti-los a outro fornecedor de serviço ou produto.\n•\tEliminação: Solicitar a eliminação dos seus dados pessoais tratados com o seu consentimento.\n•\tInformação: Obter informações sobre as entidades públicas e privadas com as quais o Bariatric Health Care realizou uso compartilhado de dados.\n•\tRevogação do Consentimento: Revogar o consentimento a qualquer momento, sem que isso afete a legalidade do tratamento realizado antes da revogação.\nPara exercer seus direitos, entre em contato conosco através do e-mail: [Seu e-mail de contato para privacidade].\n\n6. Alterações nesta Política de Privacidade\nEsta Política de Privacidade pode ser atualizada periodicamente para refletir mudanças em nossas práticas ou em requisitos legais. Quaisquer alterações serão publicadas nesta página com a data da última atualização. Recomendamos que você revise esta política regularmente.\n\n7. Legislação Aplicável e Foro\nEstes Termos de Uso e Política de Privacidade são regidos pelas leis da República Federativa do Brasil, em especial pela Lei nº 13.709/2018 (Lei Geral de Proteção de Dados - LGPD). Fica eleito o foro da comarca de [Cidade/Estado do Desenvolvedor/Empresa] para dirimir quaisquer questões decorrentes deste documento.\n\n8. Aceite\nAo marcar que está de acordo ou ao continuar a utilizar o Bariatric Health Care, você declara que leu, compreendeu e concordou com todos os termos e condições deste documento.\n\nData da Última Atualização deste termo: 13/09/2025',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                            FFAppState().Termo = true;
                            safeSetState(() {});

                            await currentUserReference!
                                .update(createPacienteRecordData(
                              termos: true,
                            ));
                          },
                          text: 'Concordo',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF249689),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Discordo',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF249689),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
