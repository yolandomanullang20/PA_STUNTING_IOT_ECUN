class IbuModel {
  int? id;
  String? namaIbu;

  IbuModel({
    this.id,
    this.namaIbu,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaIbu': namaIbu,
    };
  }

  factory IbuModel.fromMap(Map<String, dynamic> map) {
    return IbuModel(
      id: map['id'],
      namaIbu: map['namaIbu'],
    );
  }
}
