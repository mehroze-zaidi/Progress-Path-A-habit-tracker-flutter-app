import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_project_template_with_riverpod/presentation/app/progress_path_app.dart';


class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();


    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }


  static Widget buildApp() {
    return const ProgressPathApp();
  }


}