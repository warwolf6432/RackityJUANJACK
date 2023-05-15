import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/image_controller.dart';
import '../screens/form_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/database.dart';


class CameraTab extends StatefulWidget {
  @override
  State<CameraTab> createState() => _CameraTabState();
}



class _CameraTabState extends State<CameraTab> {
  late File _image;
  bool init = false;
  final imagesController = Get.find<ImagesController>();

  Future<int?> obtenerIdUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('idUsuario');
  }

  void saveImageToStorage(File imageFile, BuildContext context) async {
    final directory = await getExternalStorageDirectory();
    final imageName =
        'image_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}.jpg';
    final imagePath = '${directory!.path}/my_images/$imageName';

    if (!await Directory('${directory.path}/my_images').exists()) {
      await Directory('${directory.path}/my_images').create(recursive: true);
    }

    await imageFile.copy(imagePath);
    int? idUsuario = await obtenerIdUsuario();
    print("---------------------id de usuario:" + idUsuario.toString());
    await DatabaseHelper.instance.createPrenda(idUsuario!, imagePath, "tipo");

    imagesController.uploadImage(imageFile,"2");
    print("----------------path:" + imagePath.toString());
    //navegacion a closet
  }

  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        init = true;
        // trabajar con la imagen
      }
    });
  }



  @override
  void initState() {
    init = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _takePicture();
                      });
                    },
                    child: Text('Tomar Foto'),
                  ),
                ),
                SizedBox(width: 16), // Espacio entre botones
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      if (init) {
                        saveImageToStorage(_image, context);
                        setState(() {
                          init = false;
                        });
                      }
                    },
                    child: Text('Guardar Foto'),
                  ),
                ),
              ],
            )),
            init ? Image.file(_image) : Container(),
          ],
        ),
      ),
    );
  }
}
