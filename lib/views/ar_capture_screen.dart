import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import '../services/localization.dart';

class ARCaptureScreen extends StatefulWidget {
  const ARCaptureScreen({super.key});

  @override
  State<ARCaptureScreen> createState() => _ARCaptureScreenState();
}

class _ARCaptureScreenState extends State<ARCaptureScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  void _onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;
    arSessionManager.onInitialize(showFeaturePoints: true, showPlanes: true);
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(local.addProduct)),
      body: ARView(onARViewCreated: _onARViewCreated),
    );
  }
}
