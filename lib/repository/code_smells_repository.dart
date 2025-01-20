import 'package:code_smells_datasets_visualizer/models/code_smell.dart';
import 'package:flutter/material.dart';

class DatasetRepository {

  static List<CodeSmell> codeSmells = [
    CodeSmell(
      id: 1,
      name: "God Class",
      itemColor: [const Color(0xFF0575e6), const Color(0xFF00f260)],
      textColor: Colors.black,
      isEnabled: true,
    ),
    CodeSmell(
      id: 2,
      name: "Data Class",
      itemColor: [const Color(0xFFDE00E2), const Color(0xFF4A00E0)],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 3,
      name: "Lazy Element",
      itemColor: [Colors.red, Colors.purple],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 4,
      name: "Message Chain",
      itemColor:  [const Color(0xFF2C5364), const Color(0xFF0f2027)],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 5,
      name: "Middle Man",
      itemColor:  [const Color(0xFFf5af19), const Color(0xFFf12711)],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 6,
      name: "Insider Trading",
      itemColor:  [const Color(0xFF1CB5E0), const Color(0xFF000046)],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 7,
      name: "Refused Bequest",
      itemColor:   [const Color(0xFF24fe41), const Color(0xFFFFFF00)],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 8,
      name: "Shotgun Surgery",
      itemColor: [const Color(0xFFDE00E2), const Color(0xFF4A00E0)],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 9,
      name: "Divergent Change",
      itemColor: [const Color(0xFF1CB5E0), const Color(0xFF000046)],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 10,
      name: "Speculative Generality",
      itemColor: [const Color(0xFFf5af19), const Color(0xFFf12711)],
      textColor: Colors.white,
      isEnabled: true,
    ),
    CodeSmell(
      id: 11,
      name: "Alternative Classes",
      itemColor: [const Color(0xFF0575e6), const Color(0xFF00f260)],
      textColor: Colors.white,
      isEnabled: true,
    ),
  ];
}
