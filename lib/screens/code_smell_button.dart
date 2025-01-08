// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CodeSmellButton extends StatefulWidget {
  final String codeSmellName;
  final Color codeSmellColor;
  final bool isEnabled;
  void Function()? onClick;
  CodeSmellButton({
    super.key,
    required this.codeSmellName,
    required this.codeSmellColor,
    required this.isEnabled,
    required this.onClick,
  });

  @override
  State<CodeSmellButton> createState() => _CodeSmellButtonState();
}

class _CodeSmellButtonState extends State<CodeSmellButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.isEnabled ? widget.codeSmellColor : Colors.grey,
        ),
        child: Text(
          widget.codeSmellName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
