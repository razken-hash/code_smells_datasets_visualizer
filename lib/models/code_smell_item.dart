// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CodeSmellItem {
  final int id;
  final String code;
  final List<String> codeSmells;
  CodeSmellItem({
    required this.id,
    required this.code,
    required this.codeSmells,
  });

  CodeSmellItem copyWith({
    int? id,
    String? code,
    List<String>? codeSmells,
  }) {
    return CodeSmellItem(
      id: id ?? this.id,
      code: code ?? this.code,
      codeSmells: codeSmells ?? this.codeSmells,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'code_smells': codeSmells,
    };
  }

  factory CodeSmellItem.fromMap(Map<String, dynamic> map) {
    return CodeSmellItem(
      id: map['id'] as int,
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
  String toString() =>
      'CodeSmellItem(id: $id, code: $code, codeSmells: $codeSmells)';

  @override
  bool operator ==(covariant CodeSmellItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.code == code &&
        listEquals(other.codeSmells, codeSmells);
  }

  @override
  int get hashCode => id.hashCode ^ code.hashCode ^ codeSmells.hashCode;
}
