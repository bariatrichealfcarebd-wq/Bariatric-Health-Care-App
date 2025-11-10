import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.readLogin =
          await PacienteRecord.getDocumentOnce(currentUserReference!);
      if ((_model.readLogin?.isADM == true) ||
          (valueOrDefault<bool>(currentUserDocument?.admLess, false) == true)) {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(PaginadoNutricionistaWidget.routeName);
      } else {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(PrescricoesPageWidget.routeName);
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
