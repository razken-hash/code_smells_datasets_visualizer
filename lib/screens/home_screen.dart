import 'dart:convert';
import 'dart:io';

import 'package:code_smells_datasets_visualizer/controllers/code_smells_filter_controller.dart';
import 'package:code_smells_datasets_visualizer/models/code_smell_item.dart';
import 'package:code_smells_datasets_visualizer/repository/dataset_repository.dart';
import 'package:code_smells_datasets_visualizer/screens/dataset_screen.dart';
import 'package:code_smells_datasets_visualizer/screens/themes/colors.dart';
import 'package:code_smells_datasets_visualizer/screens/widgets/or_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CodeSmellsFilterController>(
        builder: (context, filterController, child) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 700,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CSDVColors.whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Upload your dataset!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/vectors/close.svg",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    DottedBorder(
                      strokeWidth: 2,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      color: CSDVColors.greyColor,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CSDVColors.whitishColor,
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/vectors/upload.svg",
                              height: 70,
                              width: 70,
                            ),
                            const SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: CSDVColors.blackColor,
                                  fontSize: 18,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Drag & Drop or ",
                                  ),
                                  TextSpan(
                                    text: "Choose file",
                                    style: TextStyle(
                                      color: CSDVColors.primaryColor,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: " to upload",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "JSON Format Only",
                              style: TextStyle(
                                color: CSDVColors.blackColor,
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: CSDVColors.greyishColor,
                        border: Border.all(
                          width: 2,
                          color: CSDVColors.greyColor,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/vectors/json.svg",
                            width: 70,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Text(
                                  "Code_Smells_Dataset.json",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "4.23MB",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: CSDVColors.greyColor,
                                      ),
                                    ),
                                    Text(
                                      "65%",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: CSDVColors.greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const LinearProgressIndicator(
                                  value: .5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const OrWidget(),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Import from URL",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Add file URL",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: CSDVColors.greyishColor,
                          ),
                          onPressed: () {},
                          child: Text(
                            "Clear",
                            style: TextStyle(
                              fontSize: 20,
                              color: CSDVColors.blackColor,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              File file = File(result.files.single.path!);
                              if (!result.files.single.path!
                                  .endsWith(".json")) {
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
                                final List<dynamic> dataset =
                                    jsonDecode(content);
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

                                Future.delayed(const Duration(seconds: 2))
                                    .then((_) {
                                  filterController.finishLoadingFile();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DatasetScreen(),
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
                          child: Text(
                            "Visualize",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: CSDVColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
