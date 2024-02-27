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

Future<String?> getText(String editorKeyValue) async {
  GlobalKey<HtmlEditorEnhancedState>? thisWidgetKey =
      editorKeys[editorKeyValue];

  if (thisWidgetKey?.currentState != null) {
    final String? htmlText =
        await thisWidgetKey!.currentState!.controller!.getText();
    return htmlText;
  } else {
    // FF community please handle the error how you see fit; this is just an example from me!!!
    throw Exception(
        "The GlobalKey for editorKeyValue: $editorKeyValue is not available");
  }
}
