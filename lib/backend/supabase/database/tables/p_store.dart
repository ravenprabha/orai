import '../database.dart';

class PStoreTable extends SupabaseTable<PStoreRow> {
  @override
  String get tableName => 'p.store';

  @override
  PStoreRow createRow(Map<String, dynamic> data) => PStoreRow(data);
}

class PStoreRow extends SupabaseDataRow {
  PStoreRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PStoreTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get storeid => getField<int>('storeid');
  set storeid(int? value) => setField<int>('storeid', value);

  String? get storemail => getField<String>('storemail');
  set storemail(String? value) => setField<String>('storemail', value);

  String? get aField => getField<String>('a');
  set aField(String? value) => setField<String>('a', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  int? get totaltables => getField<int>('totaltables');
  set totaltables(int? value) => setField<int>('totaltables', value);

  List<String> get categories => getListField<String>('categories');
  set categories(List<String>? value) =>
      setListField<String>('categories', value);

  List<String> get tables => getListField<String>('tables');
  set tables(List<String>? value) => setListField<String>('tables', value);
}
