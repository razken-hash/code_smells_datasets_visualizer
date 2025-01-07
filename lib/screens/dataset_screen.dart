import 'package:code_smells_datasets_visualizer/repository/dataset_repository.dart';
import 'package:code_smells_datasets_visualizer/screens/code_smell_item_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class DatasetScreen extends StatefulWidget {
  const DatasetScreen({super.key});

  @override
  State<DatasetScreen> createState() => _DatasetScreenState();
}

class _DatasetScreenState extends State<DatasetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CodeSmellItemCard(
        codeSmellItem: DatasetRepository.items[3],
      ),
    );
  }
}
