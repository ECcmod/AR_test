import 'package:vector_math/vector_math_64.dart';

enum NodeType {
  localGLTF2,
  networkGLTF2,
  localWebgltf2,
  networkWebgltf2,
  localUSDZ,
  remoteUSDZ,
  storageUSDZ,
  storageGLTF2,
}

class ARNode {
  final NodeType type;
  final String? uri;
  final List<double>? storage;
  final Vector3? position;
  final Vector3? scale;
  final Vector4? rotation;

  ARNode({
    required this.type,
    this.uri,
    this.storage,
    this.position,
    this.scale,
    this.rotation,
  }) {
    assert(
      (type == NodeType.localGLTF2 && uri != null) ||
          (type == NodeType.networkGLTF2 && uri != null) ||
          (type == NodeType.localWebgltf2 && uri != null) ||
          (type == NodeType.networkWebgltf2 && uri != null) ||
          (type == NodeType.localUSDZ && uri != null) ||
          (type == NodeType.remoteUSDZ && uri != null) ||
          (type == NodeType.storageUSDZ && storage != null) ||
          (type == NodeType.storageGLTF2 && storage != null),
      'uri is required for localGLTF2 and networkGLTF2 and localWebgltf2 and networkWebgltf2 and localUSDZ and remoteUSDZ and storageUSDZ or storageGLTF2 must be provided if required.',
    );

    assert(position != null, 'position is required.');
    assert(scale != null, 'scale is required.');
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.toString().split('.').last, // Extracting enum name
      'uri': uri,
      'storage': storage,
      'position': position?.storage.toList(), // Converting Vector3 to List
      'scale': scale?.storage.toList(), // Converting Vector3 to List
      'rotation': rotation?.storage.toList(), // Converting Vector4 to List
    };
  }
}
