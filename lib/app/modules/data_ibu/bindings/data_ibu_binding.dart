import 'package:get/get.dart';

import '../controllers/data_ibu_controller.dart';

class DataIbuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataIbuController>(
      () => DataIbuController(),
    );
  }
}
