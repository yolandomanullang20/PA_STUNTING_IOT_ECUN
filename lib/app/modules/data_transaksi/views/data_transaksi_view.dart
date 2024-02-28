import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stunting_app/utils/colors.dart';
import 'package:stunting_app/utils/typography.dart';

import '../controllers/data_transaksi_controller.dart';

class DataTransaksiView extends GetView<DataTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              "https://i.ibb.co/PGv8ZzG/me.jpg",
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.anakModelArgs.name}",
                                style: poppinsBlackBold.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${controller.anakModelArgs.age} Bulan",
                                style: poppinsBlack.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Anak dari Ibu ${controller.ibuModelArgs.namaIbu}",
                                style: poppinsBlack.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () => null,
                  child: Container(
                    height: 40,
                    width: 150,
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
                            'Tambah Data',
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
                Container(
                  height: MediaQuery.of(context).size.height - 300,
                  child: SingleChildScrollView(
                    child: Obx(
                      () => controller.isLoadingGetData.value
                          ? const Center(child: CircularProgressIndicator())
                          : GetBuilder<DataTransaksiController>(
                              init: DataTransaksiController(),
                              builder: (controller) {
                                if (controller.listDataTransaksi.isEmpty) {
                                  return Center(
                                    child: Text("Data Transaksi Kosong"),
                                  );
                                } else {
                                  return ListView.builder(
                                    itemCount:
                                        controller.listDataTransaksi.length,
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var item =
                                          controller.listDataTransaksi[index];
                                      return Card(
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.grey[200],
                                            backgroundImage: const NetworkImage(
                                              "https://i.ibb.co/QrTHd59/woman.jpg",
                                            ),
                                          ),
                                          title: Text(
                                            "Text",
                                            style: poppinsBlack.copyWith(
                                                fontSize: 16),
                                          ),
                                          subtitle: Text("Text",
                                              style: poppinsBlack.copyWith(
                                                  fontSize: 14)),
                                          trailing: Wrap(
                                            spacing:
                                                14, // space between two icons
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  Get.defaultDialog(
                                                    title: 'Hapus Data',
                                                    middleText:
                                                        'Apakah anda yakin ingin menghapus data ini?\nData yang dihapus tidak dapat dikembalikan.',
                                                    textConfirm: 'Ya',
                                                    backgroundColor:
                                                        Colors.white,
                                                    textCancel: 'Tidak',
                                                    confirmTextColor:
                                                        Colors.white,
                                                    buttonColor: pinkColorBold,
                                                    cancelTextColor:
                                                        Colors.black,
                                                    onConfirm: () {
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: pinkColorPrimer,
                                                ),
                                              ),
                                              InkWell(
                                                  onTap: () => null,
                                                  child:
                                                      const Icon(Icons.edit)),
                                              InkWell(
                                                  onTap: () => null,
                                                  child: Icon(
                                                      Icons.arrow_forward_ios)),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
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
