import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tipodesuplementodiario_widget.dart' show TipodesuplementodiarioWidget;
import 'package:flutter/material.dart';

class TipodesuplementodiarioModel
    extends FlutterFlowModel<TipodesuplementodiarioWidget> {
  ///  Local state fields for this page.

  SuplementacaodiariaRecord? supdiaria;

  DocumentReference? pacientaData;

  FFUploadedFile? ficheiroCarregado;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Tipodesuplementodiario widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in Tipodesuplementodiario widget.
  SuplementacaodiariaRecord? filtronutri;
  // Stores action output result for [Firestore Query - Query a collection] action in Tipodesuplementodiario widget.
  SuplementacaodiariaRecord? filtropaciente;
  // State field(s) for TipoDeSuplemento widget.
  final tipoDeSuplementoKey = GlobalKey();
  FocusNode? tipoDeSuplementoFocusNode;
  TextEditingController? tipoDeSuplementoTextController;
  String? tipoDeSuplementoSelectedOption;
  String? Function(BuildContext, String?)?
      tipoDeSuplementoTextControllerValidator;
  bool isDataUploading_uploadDataLd4 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData0zh = false;
  FFUploadedFile uploadedLocalFile_uploadData0zh =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData0zh = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tipoDeSuplementoFocusNode?.dispose();
  }
}
