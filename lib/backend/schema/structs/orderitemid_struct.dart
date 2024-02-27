// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderitemidStruct extends BaseStruct {
  OrderitemidStruct({
    String? item,
  }) : _item = item;

  // "item" field.
  String? _item;
  String get item => _item ?? '';
  set item(String? val) => _item = val;
  bool hasItem() => _item != null;

  static OrderitemidStruct fromMap(Map<String, dynamic> data) =>
      OrderitemidStruct(
        item: data['item'] as String?,
      );

  static OrderitemidStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderitemidStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'item': _item,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'item': serializeParam(
          _item,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrderitemidStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderitemidStruct(
        item: deserializeParam(
          data['item'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrderitemidStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderitemidStruct && item == other.item;
  }

  @override
  int get hashCode => const ListEquality().hash([item]);
}

OrderitemidStruct createOrderitemidStruct({
  String? item,
}) =>
    OrderitemidStruct(
      item: item,
    );
