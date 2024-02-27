import '../database.dart';

class AChatsTable extends SupabaseTable<AChatsRow> {
  @override
  String get tableName => 'a.chats';

  @override
  AChatsRow createRow(Map<String, dynamic> data) => AChatsRow(data);
}

class AChatsRow extends SupabaseDataRow {
  AChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AChatsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  int? get convoid => getField<int>('convoid');
  set convoid(int? value) => setField<int>('convoid', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);

  String? get date => getField<String>('date');
  set date(String? value) => setField<String>('date', value);
}
