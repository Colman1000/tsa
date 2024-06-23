import 'package:flutter/material.dart' hide Texture;
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import 'models/texture.dart';

class TextureSelector extends StatefulWidget {
  final Flutter3DController controller;
  final ValueChanged<Texture> onTextureSelected;

  const TextureSelector({
    super.key,
    required this.controller,
    required this.onTextureSelected,
  });

  @override
  _TextureSelectorState createState() => _TextureSelectorState();
}

class _TextureSelectorState extends State<TextureSelector> {

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future fetch() async{
    print(await widget.controller.getAvailableTextures());
  }

  final _textures = const [
    Texture(color: Colors.blue, name: 'midnight'),
    Texture(color: Colors.black, name: 'street'),
    Texture(color: Colors.pink, name: 'beach'),
  ];
  Texture _selectedTexture = const Texture(color: Colors.blue, name: 'midnight');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _textures.map((texture) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTexture = texture;
              });
              widget.onTextureSelected(texture);
              widget.controller.setTexture(textureName: texture.name);
              fetch();
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedTexture == texture
                      ? Colors.blue
                      : Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: Container(color: texture.color, width: 50, height: 50),
            ),
          );
        }).toList(),
      ),
    );
  }
}
