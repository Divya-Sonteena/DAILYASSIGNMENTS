import 'dart:convert';
import 'package:flutter/services.dart';

class ReadJsonFile {
  static Future<Map<String, dynamic>> readJson({
    required String path,
  }) async {
    final jsonString = await rootBundle.loadString(path);

    return json.decode(jsonString);
  }
}