import 'dart:convert';
import 'dart:io';

import 'package:code_smells_datasets_visualizer/controllers/code_smells_filter_controller.dart';
import 'package:code_smells_datasets_visualizer/models/code_smell_item.dart';
import 'package:code_smells_datasets_visualizer/repository/dataset_repository.dart';
import 'package:code_smells_datasets_visualizer/screens/dataset_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CodeSmellsFilterController>(
        builder: (context, filterController, child) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Text("WELCOME")),
            const SizedBox(
              height: 50,
            ),
            if (filterController.isLoading) const CircularProgressIndicator(),
            TextButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  File file = File(result.files.single.path!);
                  if (!result.files.single.path!.endsWith(".json")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.red,
                        content: Center(
                          child: Text(
                            "PLEASE, UPLOAD A JSON DATASET.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    filterController.loadFile();
                    final content = await file.readAsString();
                    final List<dynamic> dataset = jsonDecode(content);
                    DatasetRepository.items.clear();
                    for (Map<String, dynamic> item in dataset) {
                      DatasetRepository.items.add(
                        CodeSmellItem.fromMap(
                          item
                            ..addAll(
                              {"id": dataset.indexOf(item)},
                            ),
                        ),
                      );
                    }

                    Future.delayed(const Duration(seconds: 2)).then((_) {
                      filterController.finishLoadingFile();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DatasetScreen(),
                        ),
                      );
                    });
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.red,
                      content: Center(
                        child: Text(
                          "NO DATASET UPLOADED",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
              child: const Text("UPLOAD DATASET"),
            ),
          ],
        ),
      );
    });
  }
}
