import 'package:flutter/material.dart';
import 'package:flutter_new_project_template_with_riverpod/utils/constants/app_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// List of all assets
 List<String> _habitIcons = [


  AppAssets.alarm,
  AppAssets.apple,
  AppAssets.bar,
  AppAssets.battery,
  AppAssets.book,
  AppAssets.brain,
  AppAssets.calendar,
  AppAssets.camera,
  AppAssets.clipboard,
  AppAssets.coffee,
  AppAssets.cooking,
  AppAssets.delete,
  AppAssets.dollar,
  AppAssets.dumbbell,
  AppAssets.envelope,
  AppAssets.film,
  AppAssets.flame,
  AppAssets.floating,
  AppAssets.footprint,
  AppAssets.globe,
  AppAssets.handshake,
  AppAssets.heart,
  AppAssets.home,
  AppAssets.infinity,
  AppAssets.leaf,
  AppAssets.light,
  AppAssets.magnifying,
  AppAssets.map,
  AppAssets.moon,
  AppAssets.music,
  AppAssets.notebook,
  AppAssets.paint,
  AppAssets.paper,
  AppAssets.pencil,
  AppAssets.pie,
  AppAssets.plant,
  AppAssets.puzzle,
  AppAssets.rocket,
  AppAssets.running,
  AppAssets.shield,
  AppAssets.shopping,
  AppAssets.source,
  AppAssets.stopwatch,
  AppAssets.sun,
  AppAssets.trophy,
  AppAssets.water,
];

final habitIconsProvider = Provider(
  (ref) {
    return _habitIcons;
  },
);
