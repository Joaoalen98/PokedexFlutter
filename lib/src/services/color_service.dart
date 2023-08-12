import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorService {
  Future<PaletteGenerator?> colorPalletteImage(String imageUrl) async {
    try {
      var pallette = await PaletteGenerator.fromImageProvider(
        Image.network(imageUrl).image,
      );
      return pallette;
    } catch (e) {
      return null;
    }
  }

  Future<Color?> getDominantColor(String imageUrl) async {
    try {
      var pallette = await colorPalletteImage(imageUrl);
      var dominant = pallette!.dominantColor!.color;
      return dominant;
    } catch (e) {
      return null;
    }
  }
}
