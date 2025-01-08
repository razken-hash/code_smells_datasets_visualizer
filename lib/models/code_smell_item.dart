import 'dart:convert';

import 'package:flutter/foundation.dart';

class CodeSmellItem {
  final String code;
  final List<String> codeSmells;
  CodeSmellItem({
    required this.code,
    required this.codeSmells,
  });

  CodeSmellItem copyWith({
    String? code,
    List<String>? codeSmells,
  }) {
    return CodeSmellItem(
      code: code ?? this.code,
      codeSmells: codeSmells ?? this.codeSmells,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'code_smells': codeSmells,
    };
  }

  factory CodeSmellItem.fromMap(Map<String, dynamic> map) {
    return CodeSmellItem(
      code: map['code'] as String,
      codeSmells: (map['code_smells'] as List<dynamic>)
          .map((codeSmell) => codeSmell.toString())
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CodeSmellItem.fromJson(String source) =>
      CodeSmellItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CodeSmellItem(code: $code, codeSmells: $codeSmells)';

  @override
  bool operator ==(covariant CodeSmellItem other) {
    if (identical(this, other)) return true;

    return other.code == code && listEquals(other.codeSmells, codeSmells);
  }

  @override
  int get hashCode => code.hashCode ^ codeSmells.hashCode;
}
