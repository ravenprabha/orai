// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends BaseStruct {
  ItemsStruct({
    String? gu,
    String? item,
    int? qty,
    int? price,
    int? total,
  })  : _gu = gu,
        _item = item,
        _qty = qty,
        _price = price,
        _total = total;

  // "GU" field.
  String? _gu;
  String get gu => _gu ?? '';
  set gu(String? val) => _gu = val;
  bool hasGu() => _gu != null;

  // "Item" field.
  String? _item;
  String get item => _item ?? '';
  set item(String? val) => _item = val;
  bool hasItem() => _item != null;

  // "qty" field.
  int? _qty;
  int get qty => _qty ?? 0;
  set qty(int? val) => _qty = val;
  void incrementQty(int amount) => _qty = qty + amount;
  bool hasQty() => _qty != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;
  void incrementPrice(int amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;
  void incrementTotal(int amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        gu: data['GU'] as String?,
        item: data['Item'] as String?,
        qty: castToType<int>(data['qty']),
        price: castToType<int>(data['price']),
        total: castToType<int>(data['total']),
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'GU': _gu,
        'Item': _item,
        'qty': _qty,
        'price': _price,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'GU': serializeParam(
          _gu,
          ParamType.String,
        ),
        'Item': serializeParam(
          _item,
          ParamType.String,
        ),
        'qty': serializeParam(
          _qty,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
        gu: deserializeParam(
          data['GU'],
          ParamType.String,
          false,
        ),
        item: deserializeParam(
          data['Item'],
          ParamType.String,
          false,
        ),
        qty: deserializeParam(
          data['qty'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        gu == other.gu &&
        item == other.item &&
        qty == other.qty &&
        price == other.price &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([gu, item, qty, price, total]);
}

ItemsStruct createItemsStruct({
  String? gu,
  String? item,
  int? qty,
  int? price,
  int? total,
}) =>
    ItemsStruct(
      gu: gu,
      item: item,
      qty: qty,
      price: price,
      total: total,
    );
