import '../database.dart';

class PImglibraryTable extends SupabaseTable<PImglibraryRow> {
  @override
  String get tableName => 'p.imglibrary';

  @override
  PImglibraryRow createRow(Map<String, dynamic> data) => PImglibraryRow(data);
}

class PImglibraryRow extends SupabaseDataRow {
  PImglibraryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PImglibraryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
