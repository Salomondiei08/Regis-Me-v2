import 'package:flutter/material.dart';
import 'package:regis_me/models/entreprise.dart';

class EnterpriseProvider with ChangeNotifier {
  List<Entreprise> items = [
    Entreprise(
        nom: 'IIT',
        description: 'Best Uni',
        email: 'iit@iit.ci',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
    Entreprise(
        nom: 'VITIB',
        description: 'Best Uni',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        email: 'iit@iit.ci',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
    Entreprise(
        nom: 'LALA',
        description: 'Best Uni',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        email: 'iit@iit.ci',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
  ];

  List<Entreprise> allItems() {
    return items;
  }

  void addEnterprise(Entreprise entreprise) {
    items.insert(0, entreprise);
    notifyListeners();
  }

  List<Entreprise> searchByName(String entrepriseNom) {
    return items
        .where((entreprise) =>
            entreprise.nom.toLowerCase().contains(entrepriseNom.toLowerCase()))
        .toList();
  }
}
