import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'carregando_model.dart';
export 'carregando_model.dart';

class CarregandoWidget extends StatefulWidget {
  const CarregandoWidget({super.key});

  static String routeName = 'carregando';
  static String routePath = '/carregando';

  @override
  State<CarregandoWidget> createState() => _CarregandoWidgetState();
}

class _CarregandoWidgetState extends State<CarregandoWidget> {
  late CarregandoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarregandoModel());

    // Ação ao carregar a página.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.temNet = await actions.checkInternet();
      if (_model.temNet == false) {
        FFAppState().isOffline = true;
        safeSetState(() {});
      } else {
        FFAppState().isOffline = false;
        safeSetState(() {});
      }

      _model.pacienteData =
          await PacienteRecord.getDocumentOnce(currentUserReference!);
      if (_model.pacienteData?.termo == true) {
        _model.readLogin =
            await PacienteRecord.getDocumentOnce(currentUserReference!);
        if ((_model.readLogin?.isADM == true) ||
            (valueOrDefault<bool>(currentUserDocument?.admLess, false) ==
                true)) {
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(PaginadoNutricionistaWidget.routeName);
        } else {
          try {
            final result = await FirebaseFunctions.instance
                .httpsCallable('onFirstPatientLogin')
                .call({});
            _model.primeiroLogin = OnFirstPatientLoginCloudFunctionCallResponse(
              succeeded: true,
            );
          } on FirebaseFunctionsException catch (error) {
            _model.primeiroLogin = OnFirstPatientLoginCloudFunctionCallResponse(
              errorCode: error.code,
              succeeded: false,
            );
          }

          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(PrescricoesPageWidget.routeName);
        }
      } else {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(HomepageWidget.routeName);
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
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
