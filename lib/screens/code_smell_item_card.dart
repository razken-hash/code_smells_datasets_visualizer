// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:code_smells_datasets_visualizer/repository/dataset_repository.dart';
import 'package:flutter/material.dart';

import 'package:code_smells_datasets_visualizer/models/code_smell_item.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class CodeSmellItemCard extends StatelessWidget {
  final CodeSmellItem codeSmellItem;
  const CodeSmellItemCard({
    super.key,
    required this.codeSmellItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.blue,
                    width: 8.0,
                  ),
                  color: const Color(0xff002b36),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: ListView(
                    children: [
                      HighlightView(
                        codeSmellItem.code,
                        language: 'java',
                        padding: const EdgeInsets.all(12),
                        theme: const {
                          'root': TextStyle(
                              backgroundColor: Color(0xff002b36),
                              color: Color(0xff839496)),
                          'comment': TextStyle(color: Color(0xff586e75)),
                          'quote': TextStyle(color: Color(0xff586e75)),
                          'keyword': TextStyle(color: Color(0xff859900)),
                          'selector-tag': TextStyle(color: Color(0xff859900)),
                          'addition': TextStyle(color: Color(0xff859900)),
                          'number': TextStyle(color: Color(0xff2aa198)),
                          'string': TextStyle(color: Color(0xff2aa198)),
                          'literal': TextStyle(color: Color(0xff2aa198)),
                          'doctag': TextStyle(color: Color(0xff2aa198)),
                          'regexp': TextStyle(color: Color(0xff2aa198)),
                          'title': TextStyle(color: Color(0xff268bd2)),
                          'section': TextStyle(color: Color(0xff268bd2)),
                          'name': TextStyle(color: Color(0xff268bd2)),
                          'selector-id': TextStyle(color: Color(0xff268bd2)),
                          'selector-class': TextStyle(color: Color(0xff268bd2)),
                          'attribute': TextStyle(color: Color(0xffb58900)),
                          'attr': TextStyle(color: Color(0xffb58900)),
                          'variable': TextStyle(color: Color(0xffb58900)),
                          'template-variable':
                              TextStyle(color: Color(0xffb58900)),
                          'type': TextStyle(color: Color(0xffb58900)),
                          'symbol': TextStyle(color: Color(0xffcb4b16)),
                          'bullet': TextStyle(color: Color(0xffcb4b16)),
                          'subst': TextStyle(color: Color(0xffcb4b16)),
                          'meta': TextStyle(color: Color(0xffcb4b16)),
                          'selector-attr': TextStyle(color: Color(0xffcb4b16)),
                          'selector-pseudo':
                              TextStyle(color: Color(0xffcb4b16)),
                          'link': TextStyle(color: Color(0xffcb4b16)),
                          'built_in': TextStyle(color: Color(0xffdc322f)),
                          'deletion': TextStyle(color: Color(0xffdc322f)),
                          'formula':
                              TextStyle(backgroundColor: Color(0xff073642)),
                          'emphasis': TextStyle(fontStyle: FontStyle.italic),
                          'strong': TextStyle(fontWeight: FontWeight.bold),
                        },
                        textStyle: const TextStyle(
                          fontFamily: 'My awesome monospace font',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ...List.generate(
                codeSmellItem.codeSmells.length,
                (index) => Positioned(
                  right: 40.0 + 60 * index,
                  top: 0,
                  child: Container(
                    height: 90,
                    width: 40,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(10)),
                      color: DatasetRepository
                          .codeSmellsColors[codeSmellItem.codeSmells[index]],
                    ),
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          codeSmellItem.codeSmells[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text("${codeSmellItem.id + 1}"),
        ),
      ],
    );
  }
}
