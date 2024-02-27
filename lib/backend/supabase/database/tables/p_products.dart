import '../database.dart';

class PProductsTable extends SupabaseTable<PProductsRow> {
  @override
  String get tableName => 'p.products';

  @override
  PProductsRow createRow(Map<String, dynamic> data) => PProductsRow(data);
}

class PProductsRow extends SupabaseDataRow {
  PProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get parentid => getField<int>('parentid');
  set parentid(int? value) => setField<int>('parentid', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get storeid => getField<int>('storeid');
  set storeid(int? value) => setField<int>('storeid', value);
}
