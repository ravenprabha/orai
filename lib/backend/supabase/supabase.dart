import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl = 'https://hrygfvaktxcbjjfxcmwl.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhyeWdmdmFrdHhjYmpqZnhjbXdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQzNzU3NjksImV4cCI6MTk5OTk1MTc2OX0.wDsY-cWvjBDlfElG9ZRMmxvJNfGSV2I6nfiYaxobs2U';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
