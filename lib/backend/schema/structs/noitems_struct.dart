// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoitemsStruct extends BaseStruct {
  NoitemsStruct({
    String? name,
    int? price,
    String? category,
  })  : _name = name,
        _price = price,
        _category = category;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;
  void incrementPrice(int amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  static NoitemsStruct fromMap(Map<String, dynamic> data) => NoitemsStruct(
        name: data['name'] as String?,
        price: castToType<int>(data['price']),
        category: data['category'] as String?,
      );

  static NoitemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? NoitemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'category': _category,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
      }.withoutNulls;

  static NoitemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoitemsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NoitemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NoitemsStruct &&
        name == other.name &&
        price == other.price &&
        category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([name, price, category]);
}

NoitemsStruct createNoitemsStruct({
  String? name,
  int? price,
  String? category,
}) =>
    NoitemsStruct(
      name: name,
      price: price,
      category: category,
    );
