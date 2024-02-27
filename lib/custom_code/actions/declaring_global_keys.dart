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

// DO NOT REMOVE OR MODIFY THE CODE ABOVE

// DO NOT REMOVE OR MODIFY THE CODE ABOVE

import '/custom_code/widgets/html_editor_enhanced.dart';

// Declare GlobalKeys
final GlobalKey<HtmlEditorEnhancedState> editorKeyA =
    GlobalKey<HtmlEditorEnhancedState>();
final GlobalKey<HtmlEditorEnhancedState> editorKeyB =
    GlobalKey<HtmlEditorEnhancedState>();
final GlobalKey<HtmlEditorEnhancedState> editorKeyC =
    GlobalKey<HtmlEditorEnhancedState>();

// Create a Map to store these keys
final Map<String, GlobalKey<HtmlEditorEnhancedState>> editorKeys = {
  'editorA': editorKeyA,
  'editorB': editorKeyB,
  'editorC': editorKeyC,
};

Future declaringGlobalKeys() async {}
