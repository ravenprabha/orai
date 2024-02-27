// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextStruct extends BaseStruct {
  TextStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static TextStruct fromMap(Map<String, dynamic> data) => TextStruct(
        id: data['id'] as String?,
      );

  static TextStruct? maybeFromMap(dynamic data) =>
      data is Map ? TextStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static TextStruct fromSerializableMap(Map<String, dynamic> data) =>
      TextStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TextStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TextStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

TextStruct createTextStruct({
  String? id,
}) =>
    TextStruct(
      id: id,
    );
