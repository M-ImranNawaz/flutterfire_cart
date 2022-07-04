import 'dart:convert';

class Item {
  String id;
  String pName;
  String pQuantity;
  Item({
    required this.id,
    required this.pName,
    required this.pQuantity,
  });


  Item copyWith({
    String? id,
    String? pName,
    String? pQuantity,
  }) {
    return Item(
      id: id ?? this.id,
      pName: pName ?? this.pName,
      pQuantity: pQuantity ?? this.pQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pName': pName,
      'pQuantity': pQuantity,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] ?? '',
      pName: map['pName'] ?? '',
      pQuantity: map['pQuantity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() => 'Item(id: $id, pName: $pName, pQuantity: $pQuantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.pName == pName &&
      other.pQuantity == pQuantity;
  }

  @override
  int get hashCode => id.hashCode ^ pName.hashCode ^ pQuantity.hashCode;
}
