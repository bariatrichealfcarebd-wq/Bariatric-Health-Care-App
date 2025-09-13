import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:flutter/material.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  Local state fields for this component.

  bool editar = true;

  /// selecionar o dia e ele vai guardar
  DateTime? datee;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataKwu = false;
  FFUploadedFile uploadedLocalFile_uploadDataKwu =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataKwu = '';

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataTextController;
  String? Function(BuildContext, String?)? dataTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    dataFocusNode?.dispose();
    dataTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
