import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    fullScreen: true,
  );
  windowManager.waitUntilReadyToShow(
    windowOptions,
    () async {
      await windowManager.show();
      await windowManager.focus();
    },
  );
  runApp(
    const CodeSmellsDatasetsVisualizerApp(),
  );
}

class CodeSmellsDatasetsVisualizerApp extends StatelessWidget {
  const CodeSmellsDatasetsVisualizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
