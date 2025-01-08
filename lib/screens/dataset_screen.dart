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
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    index = (index - 1) % DatasetRepository.items.length;
                  });
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 50,
                ),
              ),
              CodeSmellItemCard(
                codeSmellItem: DatasetRepository.items[index],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    index = (index + 1) % DatasetRepository.items.length;
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
