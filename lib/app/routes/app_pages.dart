import 'package:get/get.dart';

import 'package:stunting_app/app/modules/data_anak/bindings/data_anak_binding.dart';
import 'package:stunting_app/app/modules/data_anak/views/data_anak_view.dart';
import 'package:stunting_app/app/modules/data_ibu/bindings/data_ibu_binding.dart';
import 'package:stunting_app/app/modules/data_ibu/views/data_ibu_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DATA_IBU;

  static final routes = [
    GetPage(
      name: _Paths.DATA_IBU,
      page: () => DataIbuView(),
      binding: DataIbuBinding(),
    ),
    GetPage(
      name: _Paths.DATA_ANAK,
      page: () => DataAnakView(),
      binding: DataAnakBinding(),
    ),
  ];
}
