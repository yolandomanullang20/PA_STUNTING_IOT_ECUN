import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:stunting_app/models/ibu_model.dart';
import 'package:stunting_app/utils/colors.dart';
import 'package:stunting_app/utils/typography.dart';

import '../controllers/data_ibu_controller.dart';

class DataIbuView extends GetView<DataIbuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.face_3_outlined,
                        color: blueColorBold,
                        size: 36,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Halo Selamat Pagi ...  ',
                      style: poppinsBlack.copyWith(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: () => Get.toNamed('/data-anak'),
                  child: Container(
                    height: 40,
                    width: 170,
                    decoration: BoxDecoration(
                      color: blueColorPrimer,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          14.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 22,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Tambah Data Ibu',
                            style: poppinsWhite.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //create search box
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Data Ibu',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onChanged: (value) =>
                      controller.getAllMothers(searchTerm: value),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 300,
                  child: SingleChildScrollView(
                    child: Obx(
                      () => controller.isLoadingGetData.value
                          ? const Center(child: CircularProgressIndicator())
                          : GetBuilder<DataIbuController>(
                              init: DataIbuController(),
                              builder: (controller) {
                                return ListView.builder(
                                  itemCount: controller.listDataIbu.length,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item = controller.listDataIbu[index];
                                    return Card(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.grey[200],
                                          backgroundImage: const NetworkImage(
                                            "https://i.ibb.co/QrTHd59/woman.jpg",
                                          ),
                                        ),
                                        title: Text(
                                          "${item.namaIbu}",
                                          style: poppinsBlack.copyWith(
                                              fontSize: 16),
                                        ),
                                        subtitle: Text(
                                          item.namaIbu as String,
                                        ),
                                        trailing: Wrap(
                                          spacing:
                                              14, // space between two icons
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                Get.defaultDialog(
                                                  title: 'Hapus Data',
                                                  middleText:
                                                      'Apakah anda yakin ingin menghapus data ini?',
                                                  textConfirm: 'Ya',
                                                  backgroundColor: Colors.white,
                                                  textCancel: 'Tidak',
                                                  confirmTextColor:
                                                      Colors.white,
                                                  buttonColor: pinkColorBold,
                                                  cancelTextColor: Colors.black,
                                                  onConfirm: () {
                                                    controller.deleteMotherData(
                                                        item.id!);
                                                    controller.getAllMothers();
                                                    Get.back();
                                                  },
                                                );
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: pinkColorPrimer,
                                              ),
                                            ),
                                            const Icon(Icons.edit),
                                            const Icon(Icons.arrow_forward_ios),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
