import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Color> _colors = [
  const Color(0xFFDC143C), // Crimson Red
  const Color(0xFF00BFFF), // Deep Sky Blue
  const Color(0xFF32CD32), // Lime Green
  const Color(0xFFDAA520), // Goldenrod
  const Color(0xFFBA55D3), // Medium Orchid
  const Color(0xFFFF7F50), // Coral
  const Color(0xFF6A5ACD), // Slate Blue
  const Color(0xFFFF6347), // Tomato
  const Color(0xFF3CB371), // Medium Sea Green
  const Color(0xFFDA70D6), // Orchid
  const Color(0xFF40E0D0), // Turquoise
  const Color(0xFFFA8072), // Salmon
  const Color(0xFF4169E1), // Royal Blue
  const Color(0xFFF0E68C), // Khaki
  const Color(0xFFF4A460), // Sandy Brown
  const Color(0xFFFF69B4), // Hot Pink
  const Color(0xFFF08080), // Light Coral
  const Color(0xFF4682B4), // Steel Blue
  const Color(0xFFDB7093), // Pale Violet Red
  const Color(0xFF7FFF00), // Chartreuse
  const Color(0xFFE6E6FA), // Lavender
  const Color(0xFFDEB887), // Burlywood
  const Color(0xFF8A2BE2), // Blue Violet
  const Color(0xFF5F9EA0), // Cadet Blue
  const Color(0xFFD2691E), // Chocolate
  const Color(0xFFFF4500), // Orange Red
  const Color(0xFF00FA9A), // Medium Spring Green
  const Color(0xFFB22222), // Firebrick
  const Color(0xFF9370DB), // Medium Purple
  const Color(0xFF3CB371), // Medium Sea Green
  const Color(0xFF8B0000), // Dark Red
  const Color(0xFF4682B4), // Steel Blue
];
final habitColorsProvider = Provider(
  (ref) {
    return _colors;
  },
);
