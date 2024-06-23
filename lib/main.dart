import 'package:flutter/material.dart' hide Texture;
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:tsa/models/texture.dart';
import 'model_viewer.dart';
import 'texture_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // static const color = Color(0xFF121212);
  static const color = Color(0xFFcccccc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloth Designer',
      home: Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Cloth Designer'),
        ),
        body: const DesignerScreen(),
      ),
    );
  }
}

class DesignerScreen extends StatefulWidget {
  const DesignerScreen({super.key});

  @override
  _DesignerScreenState createState() => _DesignerScreenState();
}

class _DesignerScreenState extends State<DesignerScreen> {
  late Flutter3DController controller;

  Texture _currentTexture = const Texture(color: Colors.blue, name: 'midnight');

  void _onTextureSelected(Texture texture) {
    setState(() {
      _currentTexture = texture;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = Flutter3DController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: ModelViewer(
              controller: controller,
            ),
          ),
          TextureSelector(
            onTextureSelected: _onTextureSelected,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
