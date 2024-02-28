class BBUmurModel {
  int? id;
  int? idAnak;
  double? zIndeks;
  double? ambangAtas;
  double? ambangBawah;
  String? status;
  DateTime? createdDate;

  BBUmurModel({
    this.id,
    this.idAnak,
    this.zIndeks,
    this.ambangAtas,
    this.ambangBawah,
    this.status,
    this.createdDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idAnak': idAnak,
      'zIndeks': zIndeks,
      'ambangAtas': ambangAtas,
      'ambangBawah': ambangBawah,
      'status': status,
      'createdDate': createdDate,
    };
  }

  factory BBUmurModel.fromMap(Map<String, dynamic> map) {
    return BBUmurModel(
      id: map['id'],
      idAnak: map['idAnak'],
      zIndeks: map['zIndeks'],
      ambangAtas: map['ambangAtas'],
      ambangBawah: map['ambangBawah'],
      status: map['status'],
    );
  }
}
