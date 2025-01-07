import 'dart:convert';
import 'dart:io';

import 'package:code_smells_datasets_visualizer/models/code_smell_item.dart';
import 'package:code_smells_datasets_visualizer/repository/dataset_repository.dart';
import 'package:code_smells_datasets_visualizer/screens/dataset_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text("WELCOME")),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
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
                  final content = await file.readAsString();
                  final dataset = jsonDecode(content);
                  for (Map<String, dynamic> item in dataset) {
                    DatasetRepository.items.add(CodeSmellItem.fromMap(item));
                  }
                  Future.delayed(const Duration(seconds: 2)).then((_) {
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
  }
}
