import '../database.dart';

class ParCmsTable extends SupabaseTable<ParCmsRow> {
  @override
  String get tableName => 'par.cms';

  @override
  ParCmsRow createRow(Map<String, dynamic> data) => ParCmsRow(data);
}

class ParCmsRow extends SupabaseDataRow {
  ParCmsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ParCmsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get tags => getField<String>('tags');
  set tags(String? value) => setField<String>('tags', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  String? get collection => getField<String>('collection');
  set collection(String? value) => setField<String>('collection', value);
}
