import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class CodeSmell {
  final int id;
  final String name;
  final List<Color> itemColor;
  final Color textColor;
  bool isEnabled;
  CodeSmell({
    required this.id,
    required this.name,
    required this.itemColor,
    required this.textColor,
    required this.isEnabled,
  });

  CodeSmell copyWith({
    int? id,
    String? name,
    List<Color>? itemColor,
    Color? textColor,
    bool? isEnabled,
  }) {
    return CodeSmell(
      id: id ?? this.id,
      name: name ?? this.name,
      itemColor: itemColor ?? this.itemColor,
      textColor: textColor ?? this.textColor,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'itemColor': itemColor.map((x) => x.value).toList(),
      'textColor': textColor.value,
      'isEnabled': isEnabled,
    };
  }

  factory CodeSmell.fromMap(Map<String, dynamic> map) {
    return CodeSmell(
      id: map['id'] as int,
      name: map['name'] as String,
      itemColor: List<Color>.from(
        (map['itemColor'] as List<int>).map<Color>(
          (x) => Color(x),
        ),
      ),
      textColor: Color(map['textColor'] as int),
      isEnabled: map['isEnabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CodeSmell.fromJson(String source) =>
      CodeSmell.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CodeSmell(id: $id, name: $name, itemColor: $itemColor, textColor: $textColor, isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(covariant CodeSmell other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.itemColor, itemColor) &&
        other.textColor == textColor &&
        other.isEnabled == isEnabled;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        itemColor.hashCode ^
        textColor.hashCode ^
        isEnabled.hashCode;
  }
}
