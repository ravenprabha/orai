import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'md_model.dart';
export 'md_model.dart';

class MdWidget extends StatefulWidget {
  const MdWidget({
    super.key,
    required this.content,
  });

  final String? content;

  @override
  State<MdWidget> createState() => _MdWidgetState();
}

class _MdWidgetState extends State<MdWidget> {
  late MdModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MdModel());

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
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFF000312),
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MarkdownBody(
                    data:
                        '''A.R. Rahman, born as A. S. Dileep Kumar, is a renowned Indian composer, singer, and music producer. He is widely regarded as one of the greatest music composers in the world and has been a prominent figure in the Indian music industry for several decades.

Rahman's distinctive style blends various genres and influences, creating a unique and captivating musical experience. His compositions often combine traditional Indian classical music with modern electronic and world music elements, resulting in mesmerizing melodies and innovative soundscapes.



# Hello

## hello

### hello



![Image](https://images.unsplash.com/photo-1616851770175-7ad273d9744a?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb)



---







[](https://www.anticaste.in/irfan-habib-caste-in-indian-history/)

![Video](https://www.youtube.com/watch?v=NaXSlw0Fbbw)
''',
                    selectable: true,
                    onTapLink: (_, url, __) => launchURL(url!),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
