import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class ModelViewer extends StatefulWidget {
  const ModelViewer({super.key, required this.controller});

  final Flutter3DController controller;

  @override
  _ModelViewerState createState() => _ModelViewerState();
}

class _ModelViewerState extends State<ModelViewer> {
  int _currentIndex = 0;
  final _models = [
    'assets/materials_variants_shoe.glb',
    'assets/Astronaut.glb'
  ];

  void _onSwipe(DragUpdateDetails details) {
    if (details.primaryDelta! < 0) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _models.length;
      });
    } else if (details.primaryDelta! > 0) {
      setState(() {
        _currentIndex = (_currentIndex - 1 + _models.length) % _models.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onSwipe,
      child: Center(
        child: Flutter3DViewer(
          src: _models[_currentIndex],
          controller: widget.controller,
        ),
      ),
    );
  }
}
