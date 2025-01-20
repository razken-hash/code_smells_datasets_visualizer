import 'package:code_smells_datasets_visualizer/models/code_smell.dart';
import 'package:code_smells_datasets_visualizer/models/code_smell_item.dart';
import 'package:flutter/material.dart';

class DatasetRepository {
  static List<CodeSmell> codeSmells = [];

  static Map<String, Color> codeSmellsColors = {
    "Divergent Change": Colors.black,
    "Shotgun Surgery": Colors.yellow,
    "Lazy Element": Colors.brown,
    "Speculative Generality": Colors.orange,
    "Message Chain": Colors.teal,
    "Middle Man": Colors.purple,
    "Insider Trading": Colors.pink,
    "Alternative Classes": Colors.limeAccent,
    "God Class": Colors.red,
    "Data Class": Colors.green,
    "Refused Bequest": Colors.blue,
  };

  static List<String> allCodeSmells = codeSmellsColors.keys.toList();
}
