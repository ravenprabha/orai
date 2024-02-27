import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 't1_widget.dart' show T1Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class T1Model extends FlutterFlowModel<T1Widget> {
  ///  Local state fields for this page.

  String category = '';

  List<String> cart = [];
  void addToCart(String item) => cart.add(item);
  void removeFromCart(String item) => cart.remove(item);
  void removeAtIndexFromCart(int index) => cart.removeAt(index);
  void insertAtIndexInCart(int index, String item) => cart.insert(index, item);
  void updateCartAtIndex(int index, Function(String) updateFn) =>
      cart[index] = updateFn(cart[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
