import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'productcard_model.dart';
export 'productcard_model.dart';

class ProductcardWidget extends StatefulWidget {
  const ProductcardWidget({super.key});

  @override
  State<ProductcardWidget> createState() => _ProductcardWidgetState();
}

class _ProductcardWidgetState extends State<ProductcardWidget> {
  late ProductcardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductcardModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              color: Color(0x520E151B),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.network(
                'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0a5ea9d8-2f0d-40f1-893d-3390def8a1ec/free-metcon-5-womens-training-shoes-z3mwK7.png',
                width: double.infinity,
                height: 260.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Vitsoe 1982',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '\$126.20',
                      textAlign: TextAlign.end,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF14181B),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 12.0),
              child: Text(
                'Ordered on Feb 15, 2022',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF57636C),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
