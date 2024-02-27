import '../database.dart';

class POrderitemsTable extends SupabaseTable<POrderitemsRow> {
  @override
  String get tableName => 'p.orderitems';

  @override
  POrderitemsRow createRow(Map<String, dynamic> data) => POrderitemsRow(data);
}

class POrderitemsRow extends SupabaseDataRow {
  POrderitemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => POrderitemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get itemname => getField<String>('itemname');
  set itemname(String? value) => setField<String>('itemname', value);

  int? get qty => getField<int>('qty');
  set qty(int? value) => setField<int>('qty', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get linetotal => getField<int>('linetotal');
  set linetotal(int? value) => setField<int>('linetotal', value);

  int? get receiptid => getField<int>('receiptid');
  set receiptid(int? value) => setField<int>('receiptid', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
