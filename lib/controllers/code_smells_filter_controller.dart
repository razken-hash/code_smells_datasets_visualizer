import 'package:code_smells_datasets_visualizer/models/code_smell_item.dart';
import 'package:code_smells_datasets_visualizer/repository/dataset_repository.dart';
import 'package:flutter/material.dart';

class CodeSmellsFilterController extends ChangeNotifier {
  bool isLoading = false;

  void loadFile() {
    isLoading = true;
    notifyListeners();
  }

  void finishLoadingFile() {
    isLoading = false;
    notifyListeners();
  }

  List<CodeSmellItem> get codeSmellsItems => selectedCodeSmells ==
          DatasetRepository.allCodeSmells
      ? DatasetRepository.items
      : selectedCodeSmells.isEmpty
          ? DatasetRepository.items
              .where((codeSmellsItem) => codeSmellsItem.codeSmells.isNotEmpty)
              .toList()
          : DatasetRepository.items
              .where(
                (codeSmellsItem) => selectedCodeSmells.any(
                  (selectedCodeSmell) =>
                      codeSmellsItem.codeSmells.contains(selectedCodeSmell),
                ),
              )
              .toList();

  int currentIndex = 0;

  void incrementCurrentIndex() {
    currentIndex = (currentIndex + 1) % codeSmellsItems.length;
    notifyListeners();
  }

  void decrementCurrentIndex() {
    currentIndex = (currentIndex - 1) % codeSmellsItems.length;
    notifyListeners();
  }

  List<String> selectedCodeSmells =
      DatasetRepository.codeSmellsColors.keys.toList();

  void selectAllCodeSmells() {
    DatasetRepository.allCodeSmells.map(
      (codeSmell) => selectedCodeSmells.add(codeSmell),
    );
    notifyListeners();
  }

  void unselectAllCodeSmells() {
    selectedCodeSmells = [];
    notifyListeners();
  }

  void selectCodeSmell(String codeSmell) {
    currentIndex = 0;
    selectedCodeSmells.add(codeSmell);
    notifyListeners();
  }

  void unselectCodeSmell(String codeSmell) {
    currentIndex = 0;
    selectedCodeSmells.remove(codeSmell);
    notifyListeners();
  }
}
