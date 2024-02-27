// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:html_editor_enhanced/html_editor.dart';
import '/custom_code/actions/declaring_global_keys.dart';
import 'package:file_picker/file_picker.dart';
import '/custom_code/widgets/html_editor_enhanced.dart';

Future setText(
  String? contentToSet,
  String editorKeyValue,
) async {
  GlobalKey<HtmlEditorEnhancedState>? thisWidgetKey =
      editorKeys[editorKeyValue];

  if (thisWidgetKey?.currentState != null && contentToSet != null) {
    thisWidgetKey!.currentState!.controller.setText(contentToSet);
  } else {
    // Handle the error appropriately FF community; this is just an example.
    throw Exception(
        "The GlobalKey for editorKeyValue: $editorKeyValue is not available or the text to set is empty");
  }
}
