// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<dynamic>> checkSupaUpdate() async {
  final supabase = SupabaseClient('https://hrygfvaktxcbjjfxcmwl.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhyeWdmdmFrdHhjYmpqZnhjbXdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQzNzU3NjksImV4cCI6MTk5OTk1MTc2OX0.wDsY-cWvjBDlfElG9ZRMmxvJNfGSV2I6nfiYaxobs2U');

  final subqueryResponse = await supabase
      .from('p.items')
      .select('LastSync')
      .order('LastSync', ascending: false)
      .limit(1)
      .execute();

  final LastSync = subqueryResponse.data[0]['LastSync'];

  final response = await supabase
      .from('p.items')
      .select()
      .gt('LastUpdate', LastSync)
      .execute();

  return response.data as List<dynamic>;
}
