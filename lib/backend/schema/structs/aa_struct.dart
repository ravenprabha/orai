// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AaStruct extends BaseStruct {
  AaStruct({
    String? name,
    String? mail,
    String? status,
    int? storeid,
  })  : _name = name,
        _mail = mail,
        _status = status,
        _storeid = storeid;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "mail" field.
  String? _mail;
  String get mail => _mail ?? '';
  set mail(String? val) => _mail = val;
  bool hasMail() => _mail != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "storeid" field.
  int? _storeid;
  int get storeid => _storeid ?? 0;
  set storeid(int? val) => _storeid = val;
  void incrementStoreid(int amount) => _storeid = storeid + amount;
  bool hasStoreid() => _storeid != null;

  static AaStruct fromMap(Map<String, dynamic> data) => AaStruct(
        name: data['name'] as String?,
        mail: data['mail'] as String?,
        status: data['status'] as String?,
        storeid: castToType<int>(data['storeid']),
      );

  static AaStruct? maybeFromMap(dynamic data) =>
      data is Map ? AaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'mail': _mail,
        'status': _status,
        'storeid': _storeid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'mail': serializeParam(
          _mail,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'storeid': serializeParam(
          _storeid,
          ParamType.int,
        ),
      }.withoutNulls;

  static AaStruct fromSerializableMap(Map<String, dynamic> data) => AaStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        mail: deserializeParam(
          data['mail'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        storeid: deserializeParam(
          data['storeid'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AaStruct &&
        name == other.name &&
        mail == other.mail &&
        status == other.status &&
        storeid == other.storeid;
  }

  @override
  int get hashCode => const ListEquality().hash([name, mail, status, storeid]);
}

AaStruct createAaStruct({
  String? name,
  String? mail,
  String? status,
  int? storeid,
}) =>
    AaStruct(
      name: name,
      mail: mail,
      status: status,
      storeid: storeid,
    );
