import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: componente de interface do usuário
import 'calendario_pop_widget.dart' show CalendarioPopWidget;
import 'package:flutter/material.dart';

class CalendarioPopModel extends FlutterFlowModel<CalendarioPopWidget> {
  // Campos de estado para os widgets deste componente.

  // Campo(s) de estado para Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
