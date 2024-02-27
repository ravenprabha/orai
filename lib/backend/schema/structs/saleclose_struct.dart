// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalecloseStruct extends BaseStruct {
  SalecloseStruct({
    int? cash,
    int? card,
    String? onlinetype,
    int? online,
    String? delivery,
  })  : _cash = cash,
        _card = card,
        _onlinetype = onlinetype,
        _online = online,
        _delivery = delivery;

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

  // "onlinetype" field.
  String? _onlinetype;
  String get onlinetype => _onlinetype ?? '';
  set onlinetype(String? val) => _onlinetype = val;
  bool hasOnlinetype() => _onlinetype != null;

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

  static SalecloseStruct fromMap(Map<String, dynamic> data) => SalecloseStruct(
        cash: castToType<int>(data['cash']),
        card: castToType<int>(data['card']),
        onlinetype: data['onlinetype'] as String?,
        online: castToType<int>(data['online']),
        delivery: data['delivery'] as String?,
      );

  static SalecloseStruct? maybeFromMap(dynamic data) => data is Map
      ? SalecloseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cash': _cash,
        'card': _card,
        'onlinetype': _onlinetype,
        'online': _online,
        'delivery': _delivery,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cash': serializeParam(
          _cash,
          ParamType.int,
        ),
        'card': serializeParam(
          _card,
          ParamType.int,
        ),
        'onlinetype': serializeParam(
          _onlinetype,
          ParamType.String,
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

  static SalecloseStruct fromSerializableMap(Map<String, dynamic> data) =>
      SalecloseStruct(
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
        onlinetype: deserializeParam(
          data['onlinetype'],
          ParamType.String,
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
  String toString() => 'SalecloseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SalecloseStruct &&
        cash == other.cash &&
        card == other.card &&
        onlinetype == other.onlinetype &&
        online == other.online &&
        delivery == other.delivery;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([cash, card, onlinetype, online, delivery]);
}

SalecloseStruct createSalecloseStruct({
  int? cash,
  int? card,
  String? onlinetype,
  int? online,
  String? delivery,
}) =>
    SalecloseStruct(
      cash: cash,
      card: card,
      onlinetype: onlinetype,
      online: online,
      delivery: delivery,
    );
