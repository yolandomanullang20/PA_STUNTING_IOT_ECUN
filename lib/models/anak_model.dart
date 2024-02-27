class AnakModel {
  int? id;
  int? motherId;
  String? name;
  int? age;
  String? jenisKelamin;

  AnakModel({
    this.id,
    this.motherId,
    this.name,
    this.age,
    this.jenisKelamin,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'motherId': motherId,
      'name': name,
      'age': age,
      'jenisKelamin': jenisKelamin,
    };
  }

  factory AnakModel.fromMap(Map<String, dynamic> map) {
    return AnakModel(
      id: map['id'],
      motherId: map['motherId'],
      name: map['name'],
      age: map['age'],
      jenisKelamin: map['jenisKelamin'],
    );
  }
}
