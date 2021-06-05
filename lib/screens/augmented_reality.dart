import 'dart:async';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:solar_ar/model/planet.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class AR extends StatelessWidget {
  final Planet planet;
  const AR({Key key, this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          planet.name,
          style: TextStyle(
            color: Colors.lightBlueAccent,
          ),
        ),
        elevation: 0,
        leading: BackButton(
          color: Colors.lightBlueAccent,
        ),
      ),
      body: Scene(
        planet: planet,
      ),
    );
  }
}

class Scene extends StatefulWidget {
  final Planet planet;

  const Scene({Key key, this.planet}) : super(key: key);

  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  ARKitController arKitController;
  Timer timer;

  double planetScale() {
    if (widget.planet.name == 'Mars') {
      return 0.23;
    } else if (widget.planet.name == 'Jupiter') {
      return 0.3;
    } else {
      return 0.2;
    }
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arKitController = arkitController;

    final material = ARKitMaterial(
      lightingModelName: ARKitLightingModel.lambert,
      diffuse: ARKitMaterialProperty(image: widget.planet.flatImage),
    );
    final sphere = ARKitSphere(
      materials: [material],
      radius: planetScale(),
    );

    final node = ARKitNode(
      geometry: sphere,
      position: Vector3(0, 0, -0.9),
      eulerAngles: Vector3.zero(),
    );
    this.arKitController.add(node);

    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final rotation = node.eulerAngles;
      rotation.x += 0.03;
      node.eulerAngles = rotation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ARKitSceneView(
              onARKitViewCreated: onARKitViewCreated,
            ),
          )
        ],
      ),
    );
  }
}
