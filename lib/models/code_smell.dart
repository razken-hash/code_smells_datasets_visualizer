import 'dart:convert';
import 'dart:ui';

class CodeSmell {
  final String name;
  final Color itemColor;
  final Color textColor;
  bool isEnabled;
  CodeSmell({
    required this.name,
    required this.itemColor,
    required this.textColor,
    required this.isEnabled,
  });

  CodeSmell copyWith({
    String? name,
    Color? itemColor,
    Color? textColor,
    bool? isEnabled,
  }) {
    return CodeSmell(
      name: name ?? this.name,
      itemColor: itemColor ?? this.itemColor,
      textColor: textColor ?? this.textColor,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'itemColor': itemColor.value,
      'textColor': textColor.value,
      'isEnabled': isEnabled,
    };
  }

  factory CodeSmell.fromMap(Map<String, dynamic> map) {
    return CodeSmell(
      name: map['name'] as String,
      itemColor: Color(map['itemColor'] as int),
      textColor: Color(map['textColor'] as int),
      isEnabled: map['isEnabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CodeSmell.fromJson(String source) =>
      CodeSmell.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CodeSmell(name: $name, itemColor: $itemColor, textColor: $textColor, isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(covariant CodeSmell other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.itemColor == itemColor &&
        other.textColor == textColor &&
        other.isEnabled == isEnabled;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        itemColor.hashCode ^
        textColor.hashCode ^
        isEnabled.hashCode;
  }
}
