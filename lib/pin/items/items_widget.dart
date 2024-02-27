import '/backend/sqlite/sqlite_manager.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'items_model.dart';
export 'items_model.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget>
    with TickerProviderStateMixin {
  late ItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('AddItem');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: Color(0xFFFAFAFB),
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 12.0, 0.0, 4.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.allitems = await PItemsTable().queryRows(
                              queryFn: (q) => q,
                            );
                            setState(() {
                              _model.itemindex = _model.allitems!.length - 1;
                            });
                            while (_model.index <= _model.itemindex!) {
                              _model.itemsadd = await PItemsTable().queryRows(
                                queryFn: (q) => q,
                              );
                              await SQLiteManager.instance.addItem(
                                id: _model.itemsadd![_model.index].id,
                                itemname: _model.itemsadd![_model.index].name!,
                              );
                              setState(() {
                                _model.index = _model.index + 1;
                              });
                            }

                            setState(() {});
                          },
                          child: Text(
                            'U',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF797979),
                                  fontSize: 20.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await SQLiteManager.instance.deleteAllItems();
                          },
                          child: Text(
                            'C',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF797979),
                                  fontSize: 20.0,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('pin');
                        },
                        child: Text(
                          'm',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF797979),
                                    fontSize: 20.0,
                                  ),
                        ),
                      ),
                    ]
                        .addToStart(SizedBox(width: 16.0))
                        .addToEnd(SizedBox(width: 16.0)),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle: FlutterFlowTheme.of(context).titleMedium,
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        padding: EdgeInsets.all(4.0),
                        tabs: [
                          Tab(
                            text: 'Supabase',
                          ),
                          Tab(
                            text: 'Local',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          FutureBuilder<List<PItemsRow>>(
                            future: PItemsTable().queryRows(
                              queryFn: (q) => q.order('id'),
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
                              List<PItemsRow> listViewPItemsRowList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewPItemsRowList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewPItemsRow =
                                      listViewPItemsRowList[listViewIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          listViewIndex.toString(),
                                          'index',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          listViewPItemsRow.id.toString(),
                                          'index',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          listViewPItemsRow.name,
                                          'index',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          Container(),
                        ],
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
  }
}
