import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'editar_suplementao_model.dart';
export 'editar_suplementao_model.dart';

class EditarSuplementaoWidget extends StatefulWidget {
  const EditarSuplementaoWidget({super.key});

  @override
  State<EditarSuplementaoWidget> createState() =>
      _EditarSuplementaoWidgetState();
}

class _EditarSuplementaoWidgetState extends State<EditarSuplementaoWidget> {
  late EditarSuplementaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarSuplementaoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
