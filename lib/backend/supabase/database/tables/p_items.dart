import '../database.dart';

class PItemsTable extends SupabaseTable<PItemsRow> {
  @override
  String get tableName => 'p.items';

  @override
  PItemsRow createRow(Map<String, dynamic> data) => PItemsRow(data);
}

class PItemsRow extends SupabaseDataRow {
  PItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get storeid => getField<int>('storeid');
  set storeid(int? value) => setField<int>('storeid', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get sku => getField<String>('sku');
  set sku(String? value) => setField<String>('sku', value);

  String? get unit => getField<String>('unit');
  set unit(String? value) => setField<String>('unit', value);

  int? get stock => getField<int>('stock');
  set stock(int? value) => setField<int>('stock', value);

  String? get size => getField<String>('size');
  set size(String? value) => setField<String>('size', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get material => getField<String>('material');
  set material(String? value) => setField<String>('material', value);

  String? get weight => getField<String>('weight');
  set weight(String? value) => setField<String>('weight', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  int? get cost => getField<int>('cost');
  set cost(int? value) => setField<int>('cost', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get menuvalue => getField<String>('menuvalue');
  set menuvalue(String? value) => setField<String>('menuvalue', value);

  String? get menu => getField<String>('menu');
  set menu(String? value) => setField<String>('menu', value);

  String? get groupitems => getField<String>('groupitems');
  set groupitems(String? value) => setField<String>('groupitems', value);

  List<int> get compitems => getListField<int>('compitems');
  set compitems(List<int>? value) => setListField<int>('compitems', value);
}
