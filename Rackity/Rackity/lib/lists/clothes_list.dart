import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/database.dart';
import 'package:flutter/widgets.dart';

class Garment {
  final int id;
  final ImageProvider<Object> image;

  Garment({required this.id, required this.image});
}

List<Garment> clothes = [];

Future<int?> obtenerIdUsuario() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('idUsuario');
}

void getClother() async {}

List<ImageProvider<Object>> obtenerImageProviders(List<String> rutasImagenes) {
  List<ImageProvider<Object>> imageProviders = [];

  for (String rutaImagen in rutasImagenes) {
    ImageProvider<Object> imageProvider = FileImage(File(rutaImagen));
    imageProviders.add(imageProvider);
  }

  return imageProviders;
}

Future<List<Garment>> createGarmentsList() async {
  print("----------------------------");
  List<Garment> clothes = [];
  int? idUsuario = await obtenerIdUsuario();
  List<String> tokens =
      await DatabaseHelper.instance.getTokensDeImagen(idUsuario!);
  List<ImageProvider<Object>> imagenes = obtenerImageProviders(tokens);

//Aquí se lee cada una de las imagenes y se crean los objetos para para agregarlos a la lista de prendas
  for (int i = 1; i <= imagenes.length; i++) {
    print("----------------------------imagen #" + i.toString());

    clothes.add(
      Garment(
        id: i,
        image: imagenes[i - 1],
      ),
    );
  }

  return clothes;
}
