import 'dart:async';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stunting_app/database/database_halper.dart';
import 'package:stunting_app/models/anak_model.dart';
import 'package:stunting_app/models/ibu_model.dart';

class DataAnakController extends GetxController {
  late IbuModel ibuModelArgument;
  late RxList listDataAnak = [].obs;
  var isLoadingGetData = false.obs;
  var selectedGender = "".obs;

  var dummyData = false.obs;

  Future<List<AnakModel>> getAllByIdMother(int idMother,
      {String? searchTerm}) async {
    listDataAnak.clear();
    try {
      isLoadingGetData.value = true;
      final db = await DatabaseHelper.instance.database;
      // final List<Map<String, dynamic>> maps = await db.query('children',
      //     where: 'motherId = ?', whereArgs: [ibuModelArgument.id!]);

      final List<Map<String, dynamic>> maps = searchTerm != null
          ? await db.query(
              'children',
              where: 'motherId = ? AND name LIKE ?',
              whereArgs: [idMother, '%$searchTerm%'],
            )
          : await db
              .query('children', where: 'motherId = ?', whereArgs: [idMother]);

      // final List<Map<String, dynamic>> maps = searchTerm != null
      //     ? await db.query(
      //         'mothers',
      //         where: 'namaIbu LIKE ?',
      //         whereArgs: ['%$searchTerm%'],
      //       )
      //     : await db.query('mothers');
      return List.generate(maps.length, (i) {
        listDataAnak.add(AnakModel(
          id: maps[i]['id'],
          name: maps[i]['name'],
          motherId: maps[i]['motherId'],
          age: maps[i]['age'],
          jenisKelamin: maps[i]['jenisKelamin'],
        ));
        return AnakModel(
          id: maps[i]['id'],
          name: maps[i]['name'],
          motherId: maps[i]['motherId'],
          age: maps[i]['age'],
          jenisKelamin: maps[i]['jenisKelamin'],
        );
      });
    } finally {
      isLoadingGetData.value = false;
    }
  }

  Future<void> addChildren(AnakModel anakModel) async {
    // final db = await DatabaseHelper.instance.database;
    // await db.insert('mothers', mother.toMap(),
    //     conflictAlgorithm: ConflictAlgorithm.replace);

    final db = await DatabaseHelper.instance.database;
    final Map<String, dynamic> motherMap = anakModel.toMap();

    // Remove the id from the map because SQLite will automatically assign it
    motherMap.remove('id');

    await db.insert('children', motherMap,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteChildren(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('children', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateChildren(AnakModel anakModel) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'children',
      anakModel.toMap(),
      where: 'id = ?',
      whereArgs: [anakModel.id],
    );
  }

  // Future<void> insertDummyData() async {
  //   if (dummyData.value == false) {
  //     List<AnakModel> anakModel = [
  //       AnakModel(name: "Anak 1", age: 1, motherId: 1),
  //       AnakModel(name: "Anak 2", age: 2, motherId: 1),
  //       AnakModel(name: "Anak 3", age: 3, motherId: 1),
  //       AnakModel(name: "Anak 4", age: 4, motherId: 1),
  //       AnakModel(name: "Anak 5", age: 5, motherId: 1),
  //     ];

  //     for (var item in anakModel) {
  //       await addChildren(item);
  //     }
  //     dummyData.value = true;
  //   }
  //   //5 TEMP DATA
  // }

  @override
  void onInit() {
    super.onInit();
    DatabaseHelper.instance.database;
    ibuModelArgument = Get.arguments;
    // insertDummyData();
    getAllByIdMother(ibuModelArgument.id!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
