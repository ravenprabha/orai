import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_task_widget.dart' show UpdateTaskWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateTaskModel extends FlutterFlowModel<UpdateTaskWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskController;
  String? Function(BuildContext, String?)? taskControllerValidator;
  DateTime? datePicked;
  // State field(s) for details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsController;
  String? Function(BuildContext, String?)? detailsControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskController?.dispose();

    detailsFocusNode?.dispose();
    detailsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
