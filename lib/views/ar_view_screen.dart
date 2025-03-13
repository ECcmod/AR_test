import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart'; // <-- الإضافة هنا
import 'package:vector_math/vector_math_64.dart' as vector;
import '../models/product_model.dart';

class ARViewScreen extends StatefulWidget {
  final Product product;
  const ARViewScreen({super.key, required this.product});

  @override
  State<ARViewScreen> createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  // ignore: unused_field
  ARNode? _placedNode; // <-- تمت إضافة التعليق هنا

  void _onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;
    arSessionManager.onInitialize(showFeaturePoints: false, showPlanes: true);
    _loadModel();
  }

  Future<void> _loadModel() async {
    final newNode = ARNode(
      type: NodeType.localGLTF2, // <-- أصبح المعرف معروفًا الآن
      uri: widget.product.arModel,
      scale: vector.Vector3(0.5, 0.5, 0.5),
      position: vector.Vector3(0.0, 0.0, 0.0),
    );

    try {
      await arObjectManager.addNode(newNode);
      setState(() => _placedNode = newNode);
    } catch (e) {
      debugPrint('Error loading model: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: ARView(onARViewCreated: _onARViewCreated),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }
}
