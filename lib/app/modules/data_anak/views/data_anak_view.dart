import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:stunting_app/models/anak_model.dart';
import 'package:stunting_app/models/ibu_model.dart';
import 'package:stunting_app/utils/colors.dart';
import 'package:stunting_app/utils/typography.dart';

import '../controllers/data_anak_controller.dart';

class DataAnakView extends GetView<DataAnakController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Anak Dari Ibu ${controller.ibuModelArgument.namaIbu}",
              style: poppinsBlack.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              )),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => showAddChildrenDialog(
                        context, controller.ibuModelArgument),
                    child: Container(
                      height: 40,
                      width: 182,
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
                              'Tambah Data Anak',
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
                            : GetBuilder<DataAnakController>(
                                init: DataAnakController(),
                                builder: (controller) {
                                  if (controller.listDataAnak.isEmpty) {
                                    return Center(
                                      child: Text("Data Anak Kosong"),
                                    );
                                  } else {
                                    return ListView.builder(
                                      itemCount: controller.listDataAnak.length,
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var item =
                                            controller.listDataAnak[index];
                                        return Card(
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.grey[200],
                                              backgroundImage:
                                                  const NetworkImage(
                                                "https://i.ibb.co/QrTHd59/woman.jpg",
                                              ),
                                            ),
                                            title: Text(
                                              "${item.name} - ${item.age} Bulan",
                                              style: poppinsBlack.copyWith(
                                                  fontSize: 16),
                                            ),
                                            subtitle: Text(
                                                item.jenisKelamin == 'L'
                                                    ? 'Laki-laki'
                                                    : 'Perempuan',
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
                                                      buttonColor:
                                                          pinkColorBold,
                                                      cancelTextColor:
                                                          Colors.black,
                                                      onConfirm: () {
                                                        controller
                                                            .deleteChildren(
                                                                item.id!);
                                                        controller.getAllByIdMother(
                                                            controller
                                                                .ibuModelArgument
                                                                .id!);
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
                                                    onTap: () => editChilder(
                                                        context, item),
                                                    child:
                                                        const Icon(Icons.edit)),
                                                InkWell(
                                                    onTap: () => Get.toNamed(
                                                          '/data-anak',
                                                          arguments: item,
                                                        ),
                                                    child: Icon(Icons
                                                        .arrow_forward_ios)),
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
        ));
  }

  void showAddChildrenDialog(BuildContext context, IbuModel ibuModel) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Data Anak'),
          content: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Anak (Text Only)',
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-z A-Z\s]*$')),
                ],
                onChanged: (value) => {
                  nameController.text = value.toUpperCase(),
                  nameController.selection = TextSelection.fromPosition(
                      TextPosition(offset: nameController.text.length))
                },
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Umur Anak (0-24 Bulan)',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^([0-9]|1[0-9]|2[0-4])$')),
                ],
                onChanged: (value) => {
                  ageController.text = value.toUpperCase(),
                  ageController.selection = TextSelection.fromPosition(
                      TextPosition(offset: ageController.text.length))
                },
              ),
              Text('Jenis Kelamin : '),
              //radio button with getx
              Obx(
                () => Column(
                  children: [
                    RadioListTile<String>(
                      title: const Text('Laki-laki'),
                      value: 'L',
                      groupValue: controller.selectedGender.value,
                      onChanged: (String? value) {
                        controller.selectedGender.value = value!;
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Perempuan'),
                      value: 'P',
                      groupValue: controller.selectedGender.value,
                      onChanged: (String? value) {
                        controller.selectedGender.value = value!;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                AnakModel anak = AnakModel(
                  name: nameController.text,
                  age: int.parse(ageController.text),
                  motherId: ibuModel.id!,
                  jenisKelamin: controller.selectedGender.value,
                );
                controller.addChildren(anak);
                controller.listDataAnak.clear();
                controller.getAllByIdMother(ibuModel.id!);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void editChilder(BuildContext context, AnakModel anakModel) {
    TextEditingController nameController =
        TextEditingController(text: anakModel.name!);
    TextEditingController ageController =
        TextEditingController(text: anakModel.age.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Data Anak'),
          content: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Anak (Text Only)',
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-z A-Z\s]*$')),
                ],
                onChanged: (value) => {
                  nameController.text = value.toUpperCase(),
                  nameController.selection = TextSelection.fromPosition(
                      TextPosition(offset: nameController.text.length))
                },
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Umur Anak',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^([0-9]|1[0-9]|2[0-4])$')),
                ],
                onChanged: (value) => {
                  ageController.text = value.toUpperCase(),
                  ageController.selection = TextSelection.fromPosition(
                      TextPosition(offset: ageController.text.length))
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                String namaAnak = nameController.text.trim();
                int umurAnak = int.parse(ageController.text.trim());
                if (namaAnak.isNotEmpty && umurAnak.toString().isNotEmpty) {
                  AnakModel anakUpdate = AnakModel(
                      id: anakModel.id,
                      name: namaAnak,
                      age: umurAnak,
                      motherId: anakModel.motherId,
                      jenisKelamin: anakModel.jenisKelamin);
                  controller.updateChildren(anakUpdate);
                  controller.listDataAnak.clear();
                  controller.getAllByIdMother(controller.ibuModelArgument.id!);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
