class AnakModel {
  int? id;
  int? motherId;
  String? name;
  int? age;

  AnakModel({
    this.id,
    this.motherId,
    this.name,
    this.age,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'motherId': motherId,
      'name': name,
      'age': age,
    };
  }

  factory AnakModel.fromMap(Map<String, dynamic> map) {
    return AnakModel(
        id: map['id'],
        motherId: map['motherId'],
        name: map['name'],
        age: map['age']);
  }
}
