import 'package:flutter/material.dart';
import 'clothes_list.dart';

class Outfit {
  final Garment top;
  final Garment bottom;
  final Garment shoes;

  Outfit({required this.top, required this.bottom, required this.shoes});
}

//Esta es la lista que se muestra en la app
List<Outfit> outfits = [];

List<Outfit> createOutfitsList() {
  List<Outfit> outfits = [];

//Aquí se llena la lista de outfits. Los outfits se forman a partir de la lista de prendas en clothes_lists.dart
//Esto sólo lo hice con el fin de llenar la UI y hacer pruebas, pero todo esto debe hacerse desde la base de datos
  for (int i = 1; i <= 5; i++) {
    outfits.add(
      Outfit(
        top: clothes[3 * i - 3],
        bottom: clothes[3 * i - 2],
        shoes: clothes[3 * i - 1],
      ),
    );
  }
  for (int i = 1; i <= 5; i++) {
    outfits.add(
      Outfit(
        top: clothes[3 * i - 3],
        bottom: clothes[3 * i - 2],
        shoes: clothes[3 * i - 1],
      ),
    );
  }
  return outfits;
}
