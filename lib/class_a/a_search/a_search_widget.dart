import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_search_model.dart';
export 'a_search_model.dart';

class ASearchWidget extends StatefulWidget {
  const ASearchWidget({super.key});

  @override
  State<ASearchWidget> createState() => _ASearchWidgetState();
}

class _ASearchWidgetState extends State<ASearchWidget> {
  late ASearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ASearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult73u = await GetcovodCall.call();
      setState(() {
        FFAppState().searchdata =
            (_model.apiResult73u?.jsonBody ?? '').toList().cast<dynamic>();
      });
      if ((_model.apiResult73u?.succeeded ?? true)) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('loaded'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Autocomplete<String>(
                  initialValue: TextEditingValue(),
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return FFAppState()
                        .searchdata
                        .map((e) => e.toString())
                        .toList()
                        .where((option) {
                      final lowercaseOption = option.toLowerCase();
                      return lowercaseOption
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  optionsViewBuilder: (context, onSelected, options) {
                    return AutocompleteOptionsList(
                      textFieldKey: _model.textFieldKey,
                      textController: _model.textController!,
                      options: options.toList(),
                      onSelected: onSelected,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      textHighlightStyle: TextStyle(),
                      elevation: 4.0,
                      optionBackgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      optionHighlightColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      maxHeight: 200.0,
                    );
                  },
                  onSelected: (String selection) {
                    setState(() => _model.textFieldSelectedOption = selection);
                    FocusScope.of(context).unfocus();
                  },
                  fieldViewBuilder: (
                    context,
                    textEditingController,
                    focusNode,
                    onEditingComplete,
                  ) {
                    _model.textFieldFocusNode = focusNode;

                    _model.textController = textEditingController;
                    return TextFormField(
                      key: _model.textFieldKey,
                      controller: textEditingController,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Label here...',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    );
                  },
                ),
              ),
              Builder(
                builder: (context) {
                  final data = FFAppState().searchdata.toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (context, dataIndex) {
                      final dataItem = data[dataIndex];
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 570.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Color(0xFFE0E3E7),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          child: Image.network(
                                            'https://picsum.photos/seed/988/600',
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 4.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    dataItem,
                                                    r'''$..data.title''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Abigail Wilson',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color:
                                                              Color(0xFF555555),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Abigail Wilson',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Color(
                                                                0xFFABABAB),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
