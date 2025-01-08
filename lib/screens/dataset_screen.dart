import 'package:code_smells_datasets_visualizer/repository/dataset_repository.dart';
import 'package:code_smells_datasets_visualizer/screens/code_smell_button.dart';
import 'package:code_smells_datasets_visualizer/screens/code_smell_item_card.dart';
import 'package:flutter/material.dart';

class DatasetScreen extends StatefulWidget {
  const DatasetScreen({super.key});

  @override
  State<DatasetScreen> createState() => _DatasetScreenState();
}

class _DatasetScreenState extends State<DatasetScreen> {
  List<String> selectedCodeSmells = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                CodeSmellButton(
                  codeSmellName: "ALL",
                  codeSmellColor: const Color(0xff002b36),
                  isEnabled: selectedCodeSmells ==
                      DatasetRepository.codeSmellsColors.keys.toList(),
                  onClick: () {
                    setState(() {
                      selectedCodeSmells =
                          DatasetRepository.codeSmellsColors.keys.toList();
                    });
                  },
                ),
                ...List.generate(
                  DatasetRepository.codeSmellsColors.keys.length,
                  (index) => CodeSmellButton(
                    codeSmellName:
                        DatasetRepository.codeSmellsColors.keys.toList()[index],
                    codeSmellColor: DatasetRepository.codeSmellsColors[
                        DatasetRepository.codeSmellsColors.keys
                            .toList()[index]]!,
                    isEnabled: selectedCodeSmells.contains(DatasetRepository
                        .codeSmellsColors.keys
                        .toList()[index]),
                    onClick: () {
                      setState(() {
                        if (!selectedCodeSmells.contains(DatasetRepository
                            .codeSmellsColors.keys
                            .toList()[index])) {
                          selectedCodeSmells.add(DatasetRepository
                              .codeSmellsColors.keys
                              .toList()[index]);
                        } else {
                          selectedCodeSmells.remove(DatasetRepository
                              .codeSmellsColors.keys
                              .toList()[index]);
                        }
                        
                      });
                      print(selectedCodeSmells);
                    },
                  ),
                ),
              ],
            ),
          ),
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
