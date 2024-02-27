// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:html_editor_enhanced/html_editor.dart';
import '/custom_code/actions/declaring_global_keys.dart';
import 'package:file_picker/file_picker.dart';

class HtmlEditorEnhanced extends StatefulWidget {
  factory HtmlEditorEnhanced({
    double? width,
    double? height,
    required String editorKeyValue,
  }) {
    return HtmlEditorEnhanced._internal(
      key: editorKeys[editorKeyValue],
      width: width,
      height: height,
      editorKeyValue: editorKeyValue,
    );
  }

  HtmlEditorEnhanced._internal({
    Key? key,
    this.width,
    this.height,
    required this.editorKeyValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String editorKeyValue;

  @override
  HtmlEditorEnhancedState createState() => HtmlEditorEnhancedState();
}

class HtmlEditorEnhancedState extends State<HtmlEditorEnhanced> {
  late HtmlEditorController controller;

  @override
  void initState() {
    super.initState();
    controller = HtmlEditorController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: HtmlEditor(
        controller: controller,
        // Set up additional options as needed, this is just a basic check the docs
        htmlEditorOptions: HtmlEditorOptions(
          hint: "Your text here...",
          shouldEnsureVisible: true,
          autoAdjustHeight: true,
          adjustHeightForKeyboard: true,
          spellCheck: true,
          // ... other options will come here, add a comma after each
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
          toolbarPosition: ToolbarPosition.aboveEditor,
          toolbarType: ToolbarType.nativeGrid,
          defaultToolbarButtons: [
            StyleButtons(),
            FontSettingButtons(),
            FontButtons(),
            ColorButtons(),
            ListButtons(),
            ParagraphButtons(),
            InsertButtons(),
            OtherButtons(),
          ],
          // Customize the toolbar further from here
        ),
      ),
    );
  }
}

// for ToolbarType, use 'ToolbarType.nativeScrollable' or ToolbarType.nativeExpandable to change the layout of the Toolbar icons
