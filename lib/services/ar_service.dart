import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import '../models/product_model.dart';

class ARService {
  static final ARService _instance = ARService._internal();
  factory ARService() => _instance;
  ARService._internal();

  Future<String> saveARObject({
    required String modelPath,
    required Matrix4 transformation,
  }) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final arObjectsDir = Directory('${dir.path}/ar_objects');
      if (!await arObjectsDir.exists()) {
        // تم إضافة الأقواس هنا
        await arObjectsDir.create(recursive: true);
      }

      final data = ARObjectData(
        modelPath: modelPath,
        transformation: transformation.storage.toList(),
      );

      final file = File(
        '${arObjectsDir.path}/${DateTime.now().millisecondsSinceEpoch}.json',
      );
      await file.writeAsString(jsonEncode(data.toJson()));
      return file.path;
    } catch (e) {
      throw Exception('Failed to save AR object: $e');
    }
  }

  Future<List<ARObjectData>> loadARObjects() async {
    final dir = await getApplicationDocumentsDirectory();
    final arObjectsDir = Directory('${dir.path}/ar_objects');

    if (!await arObjectsDir.exists()) return [];

    final files = arObjectsDir.list();
    List<ARObjectData> arObjects = [];
    await for (final file in files) {
      if (file.path.endsWith('.json')) {
        final content = await File(file.path).readAsString();
        arObjects.add(ARObjectData.fromJson(jsonDecode(content)));
      }
    }
    return arObjects;
  }
}
