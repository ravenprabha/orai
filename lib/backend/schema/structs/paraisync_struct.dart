// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParaisyncStruct extends BaseStruct {
  ParaisyncStruct({
    String? secretid,
    String? pageid,
  })  : _secretid = secretid,
        _pageid = pageid;

  // "secretid" field.
  String? _secretid;
  String get secretid => _secretid ?? '';
  set secretid(String? val) => _secretid = val;
  bool hasSecretid() => _secretid != null;

  // "pageid" field.
  String? _pageid;
  String get pageid => _pageid ?? '';
  set pageid(String? val) => _pageid = val;
  bool hasPageid() => _pageid != null;

  static ParaisyncStruct fromMap(Map<String, dynamic> data) => ParaisyncStruct(
        secretid: data['secretid'] as String?,
        pageid: data['pageid'] as String?,
      );

  static ParaisyncStruct? maybeFromMap(dynamic data) => data is Map
      ? ParaisyncStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'secretid': _secretid,
        'pageid': _pageid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'secretid': serializeParam(
          _secretid,
          ParamType.String,
        ),
        'pageid': serializeParam(
          _pageid,
          ParamType.String,
        ),
      }.withoutNulls;

  static ParaisyncStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParaisyncStruct(
        secretid: deserializeParam(
          data['secretid'],
          ParamType.String,
          false,
        ),
        pageid: deserializeParam(
          data['pageid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ParaisyncStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParaisyncStruct &&
        secretid == other.secretid &&
        pageid == other.pageid;
  }

  @override
  int get hashCode => const ListEquality().hash([secretid, pageid]);
}

ParaisyncStruct createParaisyncStruct({
  String? secretid,
  String? pageid,
}) =>
    ParaisyncStruct(
      secretid: secretid,
      pageid: pageid,
    );
