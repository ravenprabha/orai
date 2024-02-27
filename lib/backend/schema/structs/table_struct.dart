// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableStruct extends BaseStruct {
  TableStruct({
    String? ordertype,
    String? status,
    int? receiptno,
    int? cash,
    int? card,
    int? online,
    String? delivery,
  })  : _ordertype = ordertype,
        _status = status,
        _receiptno = receiptno,
        _cash = cash,
        _card = card,
        _online = online,
        _delivery = delivery;

  // "ordertype" field.
  String? _ordertype;
  String get ordertype => _ordertype ?? '';
  set ordertype(String? val) => _ordertype = val;
  bool hasOrdertype() => _ordertype != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "receiptno" field.
  int? _receiptno;
  int get receiptno => _receiptno ?? 0;
  set receiptno(int? val) => _receiptno = val;
  void incrementReceiptno(int amount) => _receiptno = receiptno + amount;
  bool hasReceiptno() => _receiptno != null;

  // "cash" field.
  int? _cash;
  int get cash => _cash ?? 0;
  set cash(int? val) => _cash = val;
  void incrementCash(int amount) => _cash = cash + amount;
  bool hasCash() => _cash != null;

  // "card" field.
  int? _card;
  int get card => _card ?? 0;
  set card(int? val) => _card = val;
  void incrementCard(int amount) => _card = card + amount;
  bool hasCard() => _card != null;

  // "online" field.
  int? _online;
  int get online => _online ?? 0;
  set online(int? val) => _online = val;
  void incrementOnline(int amount) => _online = online + amount;
  bool hasOnline() => _online != null;

  // "delivery" field.
  String? _delivery;
  String get delivery => _delivery ?? '';
  set delivery(String? val) => _delivery = val;
  bool hasDelivery() => _delivery != null;

  static TableStruct fromMap(Map<String, dynamic> data) => TableStruct(
        ordertype: data['ordertype'] as String?,
        status: data['status'] as String?,
        receiptno: castToType<int>(data['receiptno']),
        cash: castToType<int>(data['cash']),
        card: castToType<int>(data['card']),
        online: castToType<int>(data['online']),
        delivery: data['delivery'] as String?,
      );

  static TableStruct? maybeFromMap(dynamic data) =>
      data is Map ? TableStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ordertype': _ordertype,
        'status': _status,
        'receiptno': _receiptno,
        'cash': _cash,
        'card': _card,
        'online': _online,
        'delivery': _delivery,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ordertype': serializeParam(
          _ordertype,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'receiptno': serializeParam(
          _receiptno,
          ParamType.int,
        ),
        'cash': serializeParam(
          _cash,
          ParamType.int,
        ),
        'card': serializeParam(
          _card,
          ParamType.int,
        ),
        'online': serializeParam(
          _online,
          ParamType.int,
        ),
        'delivery': serializeParam(
          _delivery,
          ParamType.String,
        ),
      }.withoutNulls;

  static TableStruct fromSerializableMap(Map<String, dynamic> data) =>
      TableStruct(
        ordertype: deserializeParam(
          data['ordertype'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        receiptno: deserializeParam(
          data['receiptno'],
          ParamType.int,
          false,
        ),
        cash: deserializeParam(
          data['cash'],
          ParamType.int,
          false,
        ),
        card: deserializeParam(
          data['card'],
          ParamType.int,
          false,
        ),
        online: deserializeParam(
          data['online'],
          ParamType.int,
          false,
        ),
        delivery: deserializeParam(
          data['delivery'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TableStruct &&
        ordertype == other.ordertype &&
        status == other.status &&
        receiptno == other.receiptno &&
        cash == other.cash &&
        card == other.card &&
        online == other.online &&
        delivery == other.delivery;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([ordertype, status, receiptno, cash, card, online, delivery]);
}

TableStruct createTableStruct({
  String? ordertype,
  String? status,
  int? receiptno,
  int? cash,
  int? card,
  int? online,
  String? delivery,
}) =>
    TableStruct(
      ordertype: ordertype,
      status: status,
      receiptno: receiptno,
      cash: cash,
      card: card,
      online: online,
      delivery: delivery,
    );
