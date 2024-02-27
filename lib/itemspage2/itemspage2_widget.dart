import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'itemspage2_model.dart';
export 'itemspage2_model.dart';

class Itemspage2Widget extends StatefulWidget {
  const Itemspage2Widget({
    super.key,
    required this.tableno,
    required this.gu,
  });

  final int? tableno;
  final String? gu;

  @override
  State<Itemspage2Widget> createState() => _Itemspage2WidgetState();
}

class _Itemspage2WidgetState extends State<Itemspage2Widget> {
  late Itemspage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Itemspage2Model());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final productitems = FFAppState()
                        .Items
                        .where((e) => e.gu == widget.gu)
                        .toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: productitems.length,
                      itemBuilder: (context, productitemsIndex) {
                        final productitemsItem =
                            productitems[productitemsIndex];
                        return Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 8.0, 12.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productitemsItem.item,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF14181B),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Text(
                                  productitemsItem.price.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF57636C),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
