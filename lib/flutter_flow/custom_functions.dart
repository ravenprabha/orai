import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/supabase_auth/auth_util.dart';

int? invoicenumber() {
  // auto four digit invoice number which does not repeat
// Solution:

  // Generate a random number between 1000 and 9999
  int invoiceNumber = math.Random().nextInt(9000) + 1000;

  // Check if the invoice number has already been used
  // (this assumes that there is a database or some other storage mechanism to keep track of used invoice numbers)
  bool invoiceNumberExists =
      false; // replace with actual check for existing invoice number
  while (invoiceNumberExists) {
    invoiceNumber = math.Random().nextInt(9000) + 1000;
    invoiceNumberExists =
        false; // replace with actual check for existing invoice number
  }

  return invoiceNumber;
}

String? currentdate() {
  // return current date
  return DateFormat('dd/MM/yyyy').format(DateTime.now());
}

DateTime unixTimeStamp(int unixTimestampValue) {
  // convert unix timestamp in seconds to date time
  return DateTime.fromMillisecondsSinceEpoch(unixTimestampValue * 1000);
}

String extractid(String url) {
  // extract strings between = and & from the input
  final startIndex = url.indexOf('=') + 1;
  final endIndex = url.indexOf('&', startIndex);
  return url.substring(startIndex, endIndex);
}

List<String>? listnorepeat(List<String>? items) {
  // return the list with no repeat of strings
  if (items == null) return null;
  return items.toSet().toList();
}
