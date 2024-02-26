import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_anak_controller.dart';

class DataAnakView extends GetView<DataAnakController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataAnakView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () {
            DataAnakController.insertDummyData();
            DataAnakController.getAll();
          },
          child: const Text("Save"),
        ),
      ),
    );
  }
}
