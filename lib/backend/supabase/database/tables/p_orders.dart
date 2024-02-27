import '../database.dart';

class POrdersTable extends SupabaseTable<POrdersRow> {
  @override
  String get tableName => 'p.orders';

  @override
  POrdersRow createRow(Map<String, dynamic> data) => POrdersRow(data);
}

class POrdersRow extends SupabaseDataRow {
  POrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => POrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get createdAt => getField<String>('created_at')!;
  set createdAt(String value) => setField<String>('created_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get itemcount => getField<int>('itemcount');
  set itemcount(int? value) => setField<int>('itemcount', value);

  int? get storeid => getField<int>('storeid');
  set storeid(int? value) => setField<int>('storeid', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int get receiptno => getField<int>('receiptno')!;
  set receiptno(int value) => setField<int>('receiptno', value);

  int? get cash => getField<int>('cash');
  set cash(int? value) => setField<int>('cash', value);

  int? get card => getField<int>('card');
  set card(int? value) => setField<int>('card', value);

  int? get online => getField<int>('online');
  set online(int? value) => setField<int>('online', value);

  String? get delivery => getField<String>('delivery');
  set delivery(String? value) => setField<String>('delivery', value);

  String? get onlinetype => getField<String>('onlinetype');
  set onlinetype(String? value) => setField<String>('onlinetype', value);
}
