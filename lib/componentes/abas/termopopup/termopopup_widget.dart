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
                              'LEI GERAL DE PROTEÇÃO DE DADOS:\n\nEste instrumento contém os termos gerais e condições de uso do aplicativo Bariatric Health Care, bem como a sua política de privacidade, aplicáveis a todos os serviços oferecidos por seus desenvolvedores: Matheus Mencinauski de Sousa, Luiz Gustavo Rocha Gomes, Enzo Giovanni Menegatti e Fernado Faria Hong, sediados em Mogi das Cruzes, São Paulo, Brasil.\n\nAo utilizar o Bariatric Health Care, o usuário confirma que leu, compreendeu e aceitou integralmente as condições abaixo estabelecidas.\n\nDO OBJETO E NATUREZA DO SERVIÇO\n\nO Bariatric Health Care é uma ferramenta mobile desenvolvida para auxiliar no monitoramento e acompanhamento de pacientes submetidos à cirurgia bariátrica. O aplicativo permite o registro de dados pessoais, hábitos e informações de saúde para visualização e acompanhamento nutricional.\n\nDA ISENÇÃO DE RESPONSABILIDADE MÉDICA (DISCLAIMER)\n\nÉ de fundamental importância que o usuário compreenda que o Bariatric Health Care é uma ferramenta de suporte e informação. O aplicativo não substitui, sob nenhuma circunstância, o aconselhamento, diagnóstico, acompanhamento ou tratamento médico, nutricional ou de qualquer outro profissional de saúde.\n\nO aplicativo não deve ser utilizado em situações de emergência médica. Em caso de dúvidas sobre saúde, sintomas ou complicações pós-cirúrgicas, o usuário deve buscar atendimento profissional qualificado imediatamente. Os desenvolvedores não se responsabilizam por decisões de saúde tomadas com base apenas nas informações inseridas ou visualizadas no aplicativo.\n\nDO CADASTRO E ACESSO\n\nPara a utilização das funcionalidades, o usuário deverá realizar um cadastro, fornecendo informações verdadeiras, exatas, atuais e completas. O usuário é o único responsável pela segurança de suas credenciais de acesso (login e senha) e por todas as atividades realizadas em sua conta.\n\nDA COLETA E TRATAMENTO DE DADOS PESSOAIS\n\nEm conformidade com a Lei Geral de Proteção de Dados (Lei nº 13.709/2018), detalha-se a seguir a política de tratamento de dados:\n\n4.1. Coleta de Dados O aplicativo coleta dados necessários para suas funcionalidades internas, incluindo, mas não se limitando a: Dados de Cadastro: Nome completo, e-mail, número de telefone, data de nascimento e CPF. Dados de Uso: Informações de interação, telas acessadas, recursos utilizados e duração da sessão. Dados de Dispositivo: Tipo de dispositivo, sistema operacional, identificadores de dispositivo e endereço IP.\n\n4.2. Finalidade do Tratamento Os dados coletados têm por finalidade: Fornecer e personalizar os serviços do aplicativo; Melhorar e otimizar a funcionalidade; Comunicar informações importantes para o profissional da nutrição; Realizar análises estatísticas e de desempenho; Cumprir obrigações legais e regulatórias.\n\nDO ARMAZENAMENTO E SEGURANÇA\n\nOs dados pessoais coletados são armazenados em servidores seguros, localizados em infraestrutura do serviço Firebase, pertencente à Google. São empregadas medidas de segurança técnicas e administrativas padronizadas para proteger os dados contra acesso não autorizado, uso indevido, divulgação, alteração ou destruição.\n\nDO COMPARTILHAMENTO DE DADOS\n\nO Bariatric Health Care compromete-se a não compartilhar dados pessoais com terceiros, exceto: Quando exigido por lei ou ordem judicial; Mediante autorização expressa do usuário.\n\nDOS DIREITOS DO TITULAR DOS DADOS\n\nO usuário, na qualidade de titular dos dados, possui os seguintes direitos assegurados pela LGPD: Confirmação e Acesso: Obter confirmação da existência de tratamento e acesso aos dados. Correção: Solicitar a correção de dados incompletos, inexatos ou desatualizados. Anonimização, Bloqueio ou Eliminação: Requerer medidas sobre dados desnecessários ou excessivos. Portabilidade: Receber os dados pessoais para transmissão a outro fornecedor. Eliminação: Solicitar a exclusão de dados tratados com consentimento, ressalvadas as hipóteses legais de guarda. Informação: Saber sobre o uso compartilhado de dados. Revogação do Consentimento: Revogar a autorização a qualquer momento.\n\nPara exercer seus direitos, o usuário deverá entrar em contato através do e-mail de suporte disponibilizado pelos desenvolvedores.\n\nDA PROPRIEDADE INTELECTUAL\n\nTodo o conteúdo do aplicativo, incluindo códigos-fonte, design, interface, textos e gráficos, é de propriedade exclusiva dos desenvolvedores citados no preâmbulo deste documento ou de seus licenciadores. É vedada a cópia, reprodução, engenharia reversa ou distribuição não autorizada do software.\n\nDAS ALTERAÇÕES NOS TERMOS\n\nEsta política e termos de uso podem ser atualizados periodicamente para refletir mudanças nas práticas ou requisitos legais. As alterações entrarão em vigor a partir de sua publicação no aplicativo. Recomenda-se a revisão regular deste documento.\n\nDA LEGISLAÇÃO E FORO\n\nEstes Termos são regidos pelas leis da República Federativa do Brasil. Fica eleito o foro da Comarca de Mogi das Cruzes, Estado de São Paulo, para dirimir quaisquer dúvidas ou litígios decorrentes deste documento, com renúncia expressa a qualquer outro, por mais privilegiado que seja.\n\nDO ACEITE\n\nAo selecionar o checkbox de concordância ou ao continuar a utilizar o Bariatric Health Care, o usuário declara ter lido, compreendido e concordado com todos os termos e condições aqui estabelecidos.\n\nData da Última Atualização deste termo: 15/11/2025',
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
