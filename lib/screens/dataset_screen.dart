import 'package:code_smells_datasets_visualizer/controllers/code_smells_filter_controller.dart';
import 'package:code_smells_datasets_visualizer/repository/dataset_repository.dart';
import 'package:code_smells_datasets_visualizer/screens/code_smell_button.dart';
import 'package:code_smells_datasets_visualizer/screens/code_smell_item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatasetScreen extends StatefulWidget {
  const DatasetScreen({super.key});

  @override
  State<DatasetScreen> createState() => _DatasetScreenState();
}

class _DatasetScreenState extends State<DatasetScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CodeSmellsFilterController>(
        builder: (context, filterController, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              DatasetRepository.items.clear();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 40,
            ),
          ),
        ),
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
                    isEnabled: filterController.selectedCodeSmells ==
                        DatasetRepository.allCodeSmells,
                    onClick: () {
                      if (filterController.selectedCodeSmells.length !=
                          DatasetRepository.allCodeSmells.length) {
                        filterController.selectAllCodeSmells();
                      } else {
                        filterController.unselectAllCodeSmells();
                      }
                    },
                  ),
                  ...List.generate(
                    DatasetRepository.allCodeSmells.length,
                    (index) => CodeSmellButton(
                      codeSmellName: DatasetRepository.allCodeSmells[index],
                      codeSmellColor: DatasetRepository.codeSmellsColors[
                          DatasetRepository.allCodeSmells[index]]!,
                      isEnabled: filterController.selectedCodeSmells.contains(
                        DatasetRepository.allCodeSmells[index],
                      ),
                      onClick: () {
                        if (!filterController.selectedCodeSmells.contains(
                          DatasetRepository.allCodeSmells[index],
                        )) {
                          filterController.selectCodeSmell(
                              DatasetRepository.allCodeSmells[index]);
                        } else {
                          filterController.unselectCodeSmell(
                              DatasetRepository.allCodeSmells[index]);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Text(
                    "Total Number Of Smelled Instances: ${filterController.codeSmellsItems.length}")),
            Center(
                child: Text(
                    "Total Number Of Instances: ${DatasetRepository.items.length}")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    filterController.decrementCurrentIndex();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 50,
                  ),
                ),
                (filterController.codeSmellsItems.length > 1)
                    ? CodeSmellItemCard(
                        codeSmellItem: filterController
                            .codeSmellsItems[filterController.currentIndex],
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        height: MediaQuery.of(context).size.height * .6,
                        child: const Center(
                          child: Text("No Instance Available"),
                        ),
                      ),
                IconButton(
                  onPressed: () {
                    filterController.incrementCurrentIndex();
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
    });
  }
}
