import 'package:get/get.dart';
import 'package:stunting_app/database/database_halper.dart';
import 'package:stunting_app/models/anak_model.dart';

class DataAnakController extends GetxController {
  static Future<List<AnakModel>> getAll() async {
    final db = await DatabaseHelper.instance.database;
    final maps = await db.query('children');

    print('Data: $maps');

    return List.generate(maps.length, (i) {
      return AnakModel.fromMap(maps[i]);
    });
  }

  static Future<AnakModel> getById(int id) async {
    final db = await DatabaseHelper.instance.database;
    final maps = await db.query('children', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return AnakModel.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<List<AnakModel>> getByIdMother(int motherId) async {
    final db = await DatabaseHelper.instance.database;
    final maps = await db
        .query('children', where: 'motherId = ?', whereArgs: [motherId]);

    return List.generate(maps.length, (i) {
      return AnakModel.fromMap(maps[i]);
    });
  }

  static Future<void> deleteAll() async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('children');
  }

  static Future<void> deleteById(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('children', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateById(int id, Map<String, dynamic> newValues) async {
    final db = await DatabaseHelper.instance.database;
    await db.update('children', newValues, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> insertDummyData() async {
    final db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> dummyData = [
      {'id': 1, 'name': 'Child 0', 'mother_id': 1, 'age': 5},
      {'id': 2, 'name': 'Child 1', 'mother_id': 1, 'age': 6},
      {'id': 3, 'name': 'Child 2', 'mother_id': 1, 'age': 7},
      {'id': 4, 'name': 'Child 3', 'mother_id': 1, 'age': 8},
      {'id': 5, 'name': 'Child 4', 'mother_id': 1, 'age': 9},
    ];
    dummyData.forEach((data) async {
      await db.insert('children', data);
    });
  }

  @override
  void onInit() {
    super.onInit();
    DatabaseHelper.instance.database;
    insertDummyData();
    getAll();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
