import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stunting_app/database/database_halper.dart';
import 'package:stunting_app/models/ibu_model.dart';

class DataIbuController extends GetxController {
  late List<IbuModel> listDataIbu = [];

  Future<void> addMother(IbuModel mother) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('mothers', mother.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<IbuModel>> getAllMothers() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('mothers');
    return List.generate(maps.length, (i) {
      listDataIbu.add(IbuModel(
        id: maps[i]['id'],
        namaIbu: maps[i]['namaIbu'],
      ));
      return IbuModel(
        id: maps[i]['id'],
        namaIbu: maps[i]['namaIbu'],
      );
    });
  }

  Future<void> deleteAllMotherData() async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('mothers');
  }

  Future<void> updateMotherData(IbuModel mother) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'mothers',
      mother.toMap(),
      where: "id = ?",
      whereArgs: [mother.id],
    );
  }

  Future<IbuModel> getMotherById(int id) async {
    final db = await DatabaseHelper.instance.database;
    final maps = await db.query(
      'mothers',
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return IbuModel.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<void> addDummyMothers() async {
    List<IbuModel> dummyMothers = [
      IbuModel(id: 1, namaIbu: 'Ecun'),
      IbuModel(id: 2, namaIbu: 'Deminar'),
      IbuModel(id: 3, namaIbu: 'Kartika'),
      IbuModel(id: 4, namaIbu: 'Aci'),
      IbuModel(id: 5, namaIbu: 'Eve'),
      IbuModel(id: 6, namaIbu: 'Maria'),
      IbuModel(id: 7, namaIbu: 'Grace'),
      IbuModel(id: 8, namaIbu: 'Hargi'),
      IbuModel(id: 9, namaIbu: 'Ivy'),
      IbuModel(id: 10, namaIbu: 'Ketty'),
    ];
    for (var mother in dummyMothers) {
      await addMother(mother);
    }
  }

  @override
  void onInit() {
    super.onInit();
    DatabaseHelper.instance.database;
    addDummyMothers();
    getAllMothers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
