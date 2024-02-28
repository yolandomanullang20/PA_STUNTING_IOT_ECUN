import 'package:get/get.dart';
import 'package:stunting_app/database/database_halper.dart';
import 'package:stunting_app/models/anak_model.dart';
import 'package:stunting_app/models/ibu_model.dart';

class DataTransaksiController extends GetxController {
  late AnakModel anakModelArgs;
  late IbuModel ibuModelArgs;

  var isLoadingGetData = false.obs;
  var listDataTransaksi = [].obs;

  @override
  void onInit() {
    anakModelArgs = Get.arguments[0];
    ibuModelArgs = Get.arguments[1];
    DatabaseHelper.instance.database;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
