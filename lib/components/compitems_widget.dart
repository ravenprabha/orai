import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'compitems_model.dart';
export 'compitems_model.dart';

class CompitemsWidget extends StatefulWidget {
  const CompitemsWidget({
    super.key,
    required this.compitems,
  });

  final List<int>? compitems;

  @override
  State<CompitemsWidget> createState() => _CompitemsWidgetState();
}

class _CompitemsWidgetState extends State<CompitemsWidget> {
  late CompitemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompitemsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
      child: FutureBuilder<List<PItemsRow>>(
        future: PItemsTable().queryRows(
          queryFn: (q) => q.in_(
            'id',
            widget.compitems!,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              ),
            );
          }
          List<PItemsRow> listViewPItemsRowList = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listViewPItemsRowList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewPItemsRow = listViewPItemsRowList[listViewIndex];
              return Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          listViewPItemsRow.menuvalue,
                          'value',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF14181B),
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
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
    );
  }
}
