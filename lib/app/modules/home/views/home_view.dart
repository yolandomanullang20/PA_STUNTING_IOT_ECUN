import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stunting_app/app/utils/colors.dart';
import 'package:stunting_app/app/utils/typography.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(4.0),
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
                  SizedBox(
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
              Container(
                height: 40,
                width: 170,
                decoration: BoxDecoration(
                  color: blueColorPrimer,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      14.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
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
              const SizedBox(
                height: 20.0,
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/QrTHd59/woman.jpg",
                    ),
                  ),
                  title: Text(
                    "Kartika Sari",
                    style: poppinsBlack.copyWith(fontSize: 16),
                  ),
                  subtitle: Text("3 Anak"),
                  trailing: Wrap(
                    spacing: 14, // space between two icons
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: pinkColorPrimer,
                      ),
                      Icon(Icons.edit),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/QrTHd59/woman.jpg",
                    ),
                  ),
                  title: Text(
                    "Kartika Sari",
                    style: poppinsBlack.copyWith(fontSize: 16),
                  ),
                  subtitle: Text("3 Anak"),
                  trailing: Wrap(
                    spacing: 14, // space between two icons
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: pinkColorPrimer,
                      ),
                      Icon(Icons.edit),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/QrTHd59/woman.jpg",
                    ),
                  ),
                  title: Text(
                    "Kartika Sari",
                    style: poppinsBlack.copyWith(fontSize: 16),
                  ),
                  subtitle: Text("3 Anak"),
                  trailing: Wrap(
                    spacing: 14, // space between two icons
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: pinkColorPrimer,
                      ),
                      Icon(Icons.edit),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
